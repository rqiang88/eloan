module Eloan
  class Configuration
    attr_accessor :app_token, :app_key, :client_name, :env, :platform

    def initialize
      @env = 'development'
    end
  end
end