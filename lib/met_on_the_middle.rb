module MetOnTheMiddle

end

require 'met_on_the_middle/readers/base'
require 'met_on_the_middle/readers/database_time'
require 'met_on_the_middle/readers/request_count'
require 'met_on_the_middle/readers/total_time'
require 'met_on_the_middle/readers/view_time'

require 'met_on_the_middle/senders/base'
require 'met_on_the_middle/senders/file_system'
require 'met_on_the_middle/senders/zabbix'

require 'met_on_the_middle/version'
require 'met_on_the_middle/root_middleware'
require 'met_on_the_middle/configuration'
require 'met_on_the_middle/request'
require 'met_on_the_middle/collector'
require 'met_on_the_middle/tracker'
require 'met_on_the_middle/worker'


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


require 'met_on_the_middle/railtie' if defined?(Rails)
