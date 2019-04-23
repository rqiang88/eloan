module Eloan
  class Client
    include Helper::Service
    include Helper::Signature
    include Api::Payment

    attr_accessor :configurate

    def initialize(config)
      @configurate = config
    end

    def execute(request_method, url, params)
      response = RestClient::Request.execute(method: request_method, 
                    url: request_url, timeout: 10, headers: params)
    end

  end
end