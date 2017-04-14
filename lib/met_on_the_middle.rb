require 'met_on_the_middle/version'
require 'met_on_the_middle/root_middleware'
require 'met_on_the_middle/configuration'
require 'met_on_the_middle/railtie' if defined?(Rails)
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
