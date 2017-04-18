module MetOnTheMiddle::Readers
  class ViewTime < Base

    def initialize
      super :view_time
    end

    def match_subscription
      /render_(partial|template).action_view/
    end

    def parse(e, request: nil)
      path = e.payload[:identifier].split('/views/', 2)

      duration = 0
      duration = e.duration if path[1]

      (duration+(request.get(key)||0)).round(2)
    end

  end
end