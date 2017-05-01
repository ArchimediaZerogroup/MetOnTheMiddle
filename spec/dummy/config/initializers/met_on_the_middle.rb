MetOnTheMiddle.configure do |cfg|

  #cfg.notifications_event_matcher = /.*/

  # type of timer to use, valid options are
  # :sleep (default), :eventmachine, or :synchrony
  # cfg.event_mode = :sleep

  # Default Logger
  #cfg.logger = Rails.logger

  # Tempo in secondi ogni quanto eseguire un flush dei dati
  cfg.flush_interval = 5

  # Elenco Classi da Utilizzare per estrapolare le informazioni
  # Può essere anche una classe oltre ad un symbol
  #
  #cfg.readers = [:RequestCount, :TotalTime, :DatabaseTime]

  ##
  # Definisce la classe da utilizzare per spedire/registrazione le informazioni
  # Default a MetOnTheMiddle::Senders::FileSystem configurato per scrivere
  # in un file dentro alla cartella log dell'applicativo Rails
  cfg.sender =  MetOnTheMiddle::Senders::FileSystem.new(Rails.root.join('log/met_on_the_middle.log'))

  ##
  # Configurazione per Zabbix
  #
  # cfg.sender = MetOnTheMiddle::Senders::Zabbix.new(
  #     server_host: 'zabbixapp.zerogroup.it',
  #     port: 10051,
  #     identify_host: 'limos.archimedianet.it'
  # )


end