module MetOnTheMiddle
  class Tracker
    extend Forwardable

    def_delegators :actual_request, :add

    attr_reader :config

    def initialize(config)
      @config = config
    end

    # check to see if we should start a worker for this process.
    # if you are using this externally, use #start! instead as this
    # method may change
    def check_worker
      return if @worker # already running
      return unless start_worker?
      logger.debug {"config: #{config.dump}"}
      @pid = $$
      logger.debug {">> starting up worker for pid #{@pid}..."}

      @worker = Worker.new(timer: config.event_mode)
      @worker.run_periodically(config.flush_interval) do
        flush
      end

    end

    # primary collector object used by this tracker
    def collector
      @collector ||= Collector.new
    end


    # send all current data to Metrics
    def flush
      logger.debug {"flushing pid #{@pid} (#{Time.now}).."}
      start = Time.now
      # thread safety is handled internally for stores
      # queue = build_flush_queue(collector)
      # queue.submit unless queue.empty?
      unless collector.empty?
        logger.debug {"logica di invio dati - #{collector.inspect}"}
        collector.clear
      end

      logger.info {"flushed pid #{@pid} in #{(Time.now - start)*1000.to_f}ms"}
    rescue Exception => error
      logger.error {"submission failed permanently: #{error}"}
    end

    # given current state, should the tracker start a reporter thread?
    def should_start?
      true
    end

    # start worker thread, one per process.
    # if this process has been forked from an one with an active
    # worker thread we don't need to worry about cleanup, the worker
    # thread will not pass with the fork
    def start!
      check_worker if should_start?
    end

    def actual_request
      @_actual_request
    end

    ##
    # Si occupa di ragruppare per richiesta
    def request_block
      @_actual_request = Request.new
      yield
      collector.add @_actual_request
    end

    private

    # access to client instance
    def client
      @client ||= prepare_client
    end

    # use custom faraday adapter if running in evented context
    def custom_adapter
      case config.event_mode
        when :eventmachine
          :em_http
        when :synchrony
          :em_synchrony
        else
          nil
      end
    end

    def logger
      Rails.logger
    end

    # should we spin up a worker? wrap this in a process check
    # so we only actually check once per process. this allows us
    # to check again if the process forks.
    def start_worker?
      if @pid_checked == $$
        false
      else
        @pid_checked = $$
        should_start?
      end
    end

  end
end
