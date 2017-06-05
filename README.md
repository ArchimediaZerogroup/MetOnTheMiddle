# MetOnTheMiddle

[![Gem Version](https://badge.fury.io/rb/met_on_the_middle.png)](https://badge.fury.io/rb/met_on_the_middle)

Gemma per l'estrapolazione di dati da inviare poi a sistemi di analisi terzi.
Nel nostro caso specifico è stato utilizzato il sistema di monitoraggio [Zabbix](http://www.zabbix.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'met_on_the_middle' 
```

And then execute:

    $ bundle
    
Installare l'inizializzatore con le varie opzioni dell'applicativo

    $ bundle exec rails g met_on_the_middle:install
      


## Usage with Zabbix

Per implementare nuove metriche:

creare una nuova classe derivata da

    MetOnTheMiddle::Readers::Base
    
come quelle già presenti, leggere direttamente la documentazione 
su tale classe

Nel caso non esistesse un ActiveSupport::Notifications che fa al caso vostro
registratelo come definito nella 
[documentazione](http://guides.rubyonrails.org/active_support_instrumentation.html)
 e registrate quindi la vostra classe per quell'evento
 
Ricordardarsi di aggiungere la classe corretta nell'array dei readers nella 
configurazione dell'inizializer
 
 
Aggiungere quindi su Zabbix all'host interessato il Template Rails preparato.
Ho estraolato anche il template e posizionato in doc/zbx_export_templates.xml

