require "eloan/version"
require "active_support"
require "rest-client"

module Eloan
	extend ActiveSupport::Autoload
	
	autoload :Client
	autoload :Configuration
	autoload :Api

	class << self
    def configuration
      yield configure
    end

    def configure
      @config ||= Configuration.new
    end

    def api
      @eloan ||= ApiLoader.with(configure) 
    end
  end
end
