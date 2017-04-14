module MetOnTheMiddle
  class Configuration

    attr_accessor :notifications_event_matcher

    def initialize
      @notifications_event_matcher = /.*/
    end

  end
end