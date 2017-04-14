module MetOnTheMiddle
  class Collector < Hash

    attr_accessor :sender

    def initialize(sender)
      self.sender = sender
      super(Request.new)
    end

    def add(request)
      self[request.time]=request
    end


    def submit
      each do |k,v|
        self.sender.write(v)
      end
    end

  end
end