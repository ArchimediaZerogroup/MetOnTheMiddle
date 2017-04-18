module MetOnTheMiddle
  class Collector < Hash

    MAX_QUEUE_SIZE_AUTOCLEAR = 100
    attr_accessor :sender

    def initialize(sender)
      self.sender = sender
      super(Request.new)
    end

    def add(request)
      self[request.time]=request
    end


    def submit
      Marshal.load(Marshal.dump(self)).each do |k, v|
        self.sender.write(v)
      end
      self.clear
    rescue Exception => e
      if self.size>MAX_QUEUE_SIZE_AUTOCLEAR

        pre_clear = self.keys[self.size/2]

        self.reject! {|k, v| k<pre_clear}

      end
    end

  end
end