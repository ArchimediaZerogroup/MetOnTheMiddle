module MetOnTheMiddle
  ##
  # Classe che si occupa di raggruppare le informazioni per richiesta,
  # se la chiave è già presente, il valore viene sommato
  class Request

    attr_accessor :time
    attr_reader :data

    def initialize(time=Time.new)
      @time = time
      @data = {}
    end

    def add(key, value)
      @data[key]=value
    end

    def get(key)
      @data[key]
    end

  end
end