module MetOnTheMiddle
  class Configuration

    ##
    # Regular expression per selezionare l'event matcher
    attr_accessor :notifications_event_matcher

    # type of timer to use, valid options are
    # :sleep (default), :eventmachine, or :synchrony
    attr_accessor :event_mode

    ##
    # Tempo in secondi ogni quanto eseguire un flush dei dati
    attr_accessor :flush_interval

    attr_accessor :logger


    attr_reader :tracker

    def initialize
      @notifications_event_matcher = /.*/
      @event_mode= :sleep
      @tracker = nil
      @logger = Rails.logger
      @flush_interval = 10
    end


    def dump

      {
          notifications_event_matcher: :notifications_event_matcher,
          event_mode: :event_mode
      }

    end

  end
end