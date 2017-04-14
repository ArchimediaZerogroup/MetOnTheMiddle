module MetOnTheMiddle::Readers
  ##
  # Classe base del reader, la quale deve rispondere con la chiave da
  # utilizzare per dare un label al dato inviato (chiave per zabbix)
  #
  class Base
    include Singleton
    extend SingleForwardable

    def_delegators :instance, :parse, :to_key_value, :register_subscription

    attr_accessor :key

    def initialize(key)
      @key = key
    end

    ##
    # Regular expression to match notifications
    def match_subscription
      ''
    end

    #
    # metodo da utilizzare per parsare i dati
    def parse(event)
      event.name
    end

    def to_key_value(event)
      return @key, parse(event)
    end


    def register_subscription(tracker)
      ActiveSupport::Notifications.subscribe match_subscription do |*args|
        event = ActiveSupport::Notifications::Event.new *args

        tracker.add *self.to_key_value(event)
        # event.name # => "process_action.action_controller"
        # event.duration # => 10 (in milliseconds)
        # event.payload # => {:extra=>information}

        # Rails.logger.info "#{event.inspect} Received!"
        # Rails.logger.info "----------"
      end
    end

  end
end