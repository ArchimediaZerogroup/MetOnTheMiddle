module MetOnTheMiddle
  class Collector < Hash

    def initialize
      super(Request.new)
    end

    def add(request)
      self[request.time]=request
    end

  end
end