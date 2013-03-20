autoload :Version, 'platidoma/version'
require "addressable/uri"
require "weary"
require 'happymapper'

module Platidoma
  autoload 'Client', 'platidoma/client'
  autoload 'ClientProxy', 'platidoma/client_proxy'
  autoload 'Response', 'platidoma/response/get_status'
  autoload 'Configuration', 'platidoma/configuration'


  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

end
