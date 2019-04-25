module Eloan
  module Helper
    module Signature
      def hexdigest(data)
        digest = OpenSSL::Digest.new('SHA256')
        OpenSSL::HMAC.hexdigest(digest, configurate.app_key, data)
      end

      def verify?(data, signature)
        hexdigest(data) == signature
      end

      def handle_request_data(request_method, url, params)
        data = [request_method, url, change_params(params)] * ''
      end

      def handle_response_data(params)
        params.delete('signature')
        data = change_params(params)
      end

      private 

      def change_params(params)
        data = params.sort.map do |k, v|
          "#{k}=#{v}" if v.present?
        end
        data.compact * '&'
      end
    end
  end
end