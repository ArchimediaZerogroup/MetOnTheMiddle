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
  #cfg.readers = [:RequestCount, :TotalTime, :DatabaseTime, :ViewTime]

  ##
  # Definisce la classe da utilizzare per spedire/registrazione le informazioni
  # Default a MetOnTheMiddle::Senders::FileSystem configurato per scrivere
  # in un file dentro alla cartella log dell'applicativo Rails
  #cfg.sender =  Senders::FileSystem(Rails.root.join('log/met_on_the_middle.log'))

  ##
  # Configurazione per Zabbix
  #
  # cfg.sender =  MetOnTheMiddle::Senders::Zabbix.new(
  #   server_host: '127.0.0.1',
  #   port: 10051,
  #   identify_host:'nome.mio.host'
  # )




end