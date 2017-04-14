module MetOnTheMiddle::Readers
  ##
  # Classe base del reader, la quale deve rispondere con la chiave da
  # utilizzare per dare un label al dato inviato (chiave per zabbix)
  #
  class Base
    include Singleton
    extend SingleForwardable

    def_delegators :instance, :parse, :to_key_value

    attr_accessor :key

    def initialize(key)
      @key = key
    end

    #
    # metodo da utilizzare per parsare i dati
    def parse(raw)
      raw
    end

    def to_key_value(raw)
      return @key, parse(raw)
    end

  end
end