MetOnTheMiddle.configure do |cfg|

  #cfg.notifications_event_matcher = /.*/

  # type of timer to use, valid options are
  # :sleep (default), :eventmachine, or :synchrony
  # cfg.event_mode = :sleep

  # Default Logger
  #cfg.logger = Rails.logger

  # Tempo in secondi ogni quanto eseguire un flush dei dati
  # cfg.flush_interval = 60

  # Elenco Classi da Utilizzare per estrapolare le informazioni
  # Può essere anche una classe oltre ad un symbol
  #
  #cfg.readers = [:RequestCount, :TotalTime, :DatabaseTime]


end