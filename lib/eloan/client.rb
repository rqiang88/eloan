require 'eloan/api'

module Eloan
  class Client
    include Api

    attr_accessor :configurate

    def initialize(config)
      @configurate = config
    end

    def execute(method, url, options)
      if method == 'get'
        response = RestClient.get(URI.escape(url), options) 
      else
        response = RestClient.post(URI.escape(url), options) 
      end
      raw_response response
    end

  end
end