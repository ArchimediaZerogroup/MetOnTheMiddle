module MetOnTheMiddle
  class Collector

    MAX_QUEUE_SIZE_AUTOCLEAR = 100
    attr_accessor :sender, :data

    delegate :clear, :size, :empty?, to: :data

    def initialize(sender)
      self.sender = sender
      @data = Hash.new
    end

    def add(request)
      @data[request.time]=request
    end


    def submit
      Marshal.load(Marshal.dump(@data)).each do |k, v|
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