module Eloan
  class Configuration
    attr_accessor :app_token, :app_key, :client_name, :company_name, 
                  :env, :platform, :bg_return_url

    def initialize
      @env = 'development'
    end
  end
end