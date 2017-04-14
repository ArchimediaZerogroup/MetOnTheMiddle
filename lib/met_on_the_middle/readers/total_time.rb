module MetOnTheMiddle::Readers
  class TotalTime < Base

    def initialize
      super(:total_time)
    end

    def match_subscription
      'met_on_the_middleware.total_time'
    end

    def parse(event,request:nil)
      event.duration
    end

  end
end