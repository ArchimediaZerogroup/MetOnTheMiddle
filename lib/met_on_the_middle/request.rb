module MetOnTheMiddle
  ##
  # Classe che si occupa di raggruppare le informazioni per richiesta
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

  end
end