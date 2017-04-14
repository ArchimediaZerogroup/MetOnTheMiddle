module MetOnTheMiddle::Readers
  class RequestCount < Base

    def initialize
      super(:request_count)
    end

    def match_subscription
      'met_on_the_middleware.total_time'
    end

    def parse(event, request: nil)
      1
    end

  end
end