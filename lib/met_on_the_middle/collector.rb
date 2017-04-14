module MetOnTheMiddle
  class Collector < Hash

    def initialize
      super(0)
    end

    def add(key,value)
      self[key]=value
    end

  end
end