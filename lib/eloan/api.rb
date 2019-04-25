require 'eloan/helper/payment'
require 'eloan/helper/service'
require 'eloan/helper/signature'
require 'eloan/helper/request'

module Eloan
  module Api
    include Helper::Service
    include Helper::Signature
    include Helper::Payment
    include Helper::Request


    def pay code, data = {}
      request = request_params(code.to_s)
      url = generate_request_url(request[:url])
      request_method = request[:method]

      options = handle_params(generate_default_params.merge(data))
      default_params = request[:default]
      default_params.keys.each{|k| options[k] = default_params[k] if options[k].blank? }
      options["signature"] = hexdigest(handle_request_data(request_method, url, options))

      response = execute(request_method, url, options)
    end

    def verify options
      signature =  options.delete('signature')
      data = handle_response_data options
      verify?(data, signature)
    end
  end
end