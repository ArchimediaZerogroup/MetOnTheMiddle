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
    # Serve per attivare la subscription a determinati eventi di
    # ActiveSupport::Notifications
    def match_subscription
      ''
    end

    #
    # metodo da utilizzare per parsare i dati
    #
    # @author Bonetti Marino
    #
    #
    # @param [ActiveSupport::Notifications::Event] event proveniente dalla subscription
    # @option opts [MetOnTheMiddle::Request] :request oggetto che raggruppa la richiesta, utile se si
    #                                devono sommare dati
    #
    # @return il valore da salvare ed inviare nei provider di registrazione
    def parse(event, request: nil)
      event.name
    end

    def to_key_value(event, request: nil)
      return @key, parse(event, request: request)
    end


    def register_subscription(tracker)
      ActiveSupport::Notifications.subscribe match_subscription do |*args|
        unless tracker.nil?
          event = ActiveSupport::Notifications::Event.new *args
          tracker.add *self.to_key_value(event, request: tracker.actual_request)
        end
      end
    end

  end
end