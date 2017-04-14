# MetOnTheMiddle

Gemma per l'estrapolazione di dati da inviare poi a vari 
sistemi di analisi

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'met_on_the_middle'
```

And then execute:

    $ bundle
    
Installare l'inizializzatore con le varie opzioni dell'applicativo

    $ bundle exec rails g met_on_the_middle:install
      


## Usage

###Per implementare nuove metriche:
creare una nuova classe derivata da

    MetOnTheMiddle::Readers::Base
    
come quelle già presenti, leggere direttamente la documentazione 
su tale classe

Nel caso non esistesse un ActiveSupport::Notifications che fa al caso vostro
registratelo come definito nella 
[documentazione](http://guides.rubyonrails.org/active_support_instrumentation.html)
 e registrazione quindi la vostra classe per quell'evento
 
Ricordardarsi di aggiungere la classe corretta nell'array dei readers

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

