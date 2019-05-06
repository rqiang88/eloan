require 'eloan/api'

module Eloan
  class Client
    include Api

    attr_accessor :configurate

    def initialize(config)
      @configurate = config
    end

    def execute(request_method, url, options)
      response = RestClient::Request.execute(method: request_method, 
                    url: URI.escape(url), headers: {params: options})

      raw_response response
    end

  end
end