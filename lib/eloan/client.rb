module Eloan
  class Client
    attr_accessor :configurate
    def initialize(config)
      @configurate = config
    end

    def execute(request_method, url, params)
      response = RestClient::Request.execute(method: request_method, 
                    url: request_url, timeout: 10, headers: params)
    end

    private

    def handle_url url
      request_url
    end
  end
end