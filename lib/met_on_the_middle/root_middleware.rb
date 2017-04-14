module MetOnTheMiddle
  class RootMiddleware


    attr_reader :tracker

    def initialize(app)
      @app = app

      @tracker = Tracker.new(MetOnTheMiddle.configuration)
      @tracker.start!

    end

    ##
    # Serve per essere multy trade safe
    def call(env)
      dup._call(env)
    end

    def _call(env)

      response, duration = process_request(env)

      #qua non dovremmo far altro che spedire a zabbix i dati

      # Rails.logger.debug {status.inspect}
      # Rails.logger.debug {headers.inspect}
      # Rails.logger.debug {response.inspect}

      @tracker.request_block do
        @tracker.add *Readers::TotalTime.to_key_value(duration)
        @tracker.add *Readers::RequestCount.to_key_value(1)
        @tracker.add :chiave, 10
      end


      response
    end


    def process_request(env)
      time = Time.now
      response = @app.call(env)
      duration = (Time.now - time) * 1000.0
      [response, duration]
    end

  end
end