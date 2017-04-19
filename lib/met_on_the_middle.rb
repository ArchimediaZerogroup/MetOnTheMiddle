module MetOnTheMiddle
  # Your code goes here...

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

end

Dir[File.expand_path('../met_on_the_middle/readers/*.rb', __FILE__)].each {|file| require file}
Dir[File.expand_path('../met_on_the_middle/senders/*.rb', __FILE__)].each {|file| require file}
require 'met_on_the_middle/version'
require 'met_on_the_middle/root_middleware'
require 'met_on_the_middle/configuration'
require 'met_on_the_middle/request'
require 'met_on_the_middle/collector'
require 'met_on_the_middle/tracker'
require 'met_on_the_middle/worker'



require 'met_on_the_middle/railtie' if defined?(Rails)
