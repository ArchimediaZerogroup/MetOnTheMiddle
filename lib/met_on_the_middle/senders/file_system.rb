module MetOnTheMiddle::Senders
  class FileSystem < Base

    attr_accessor :logger

    def initialize(path)
      self.logger = ::Logger.new(path, 2)
    end


    def write(request)
      self.logger.info request.time.to_s do
        keys = []
        request.data.each do |k, v|
          keys<<"#{k}:#{v}"
        end
        keys.join("|")
      end
    end
  end
end