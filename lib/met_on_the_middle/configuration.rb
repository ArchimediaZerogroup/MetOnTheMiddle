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

    ##
    # Definisce la classe da utilizzare per spedire/registrazione le informazioni
    # Default a MetOnTheMiddle::Senders::FileSystem configurato per scrivere
    # in un file dentro alla cartella log dell'applicativo Rails
    attr_accessor :sender

    attr_accessor :logger


    attr_reader :tracker

    def initialize
      @notifications_event_matcher = /.*/
      @event_mode= :sleep
      @tracker = nil
      @logger = Rails.logger
      @sender = Senders::FileSystem.new(Rails.root.join('log/met_on_the_middle.log'))
      @flush_interval = 10
      self.readers = [:RequestCount, :TotalTime, :DatabaseTime]
    end


    def dump

      {
          notifications_event_matcher: :notifications_event_matcher,
          event_mode: :event_mode
      }

    end


    def readers=(array)
      @_readers = array.collect {|c|
        if c.is_a?(Symbol)
          Readers.const_get(c)
        else
          c
        end
      }
    end

    def readers
      @_readers
    end

  end
end