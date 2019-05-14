module Eloan
  module Helper
    module Service
      attr_accessor :chaxue
      def generate_request_url(url='')
        [default_url, url] * ''
      end

      def handle_params(options={})
        ActiveSupport::HashWithIndifferentAccess.new(options)
      end

      def raw_response(response)
        return {status: :fail, code: 502, message: '请求失败,请稍后重试'} unless response.code.to_i == 200

        response = JSON.parse response.body
        response_code = response['response_code']

        if response_code.last(2).to_s == '00'
          status, code, message = 'success', 200, 'success'
        else
          if request_params(response_code.first(3))[:notify] && response_code.last(2).to_s == '01'
            status, code, message = 'success', 201, '处理中'
          else
            message = response['bind_error_message'].present? ? response['bind_error_message'] : response['response_message']
            status, code = 'fail', 202
          end
        end

        response = {status: status, code: code, message: message, data: response}
        unless configurate.production?
          eloan_message = instance_variable_get(:@eloan_message)
          response = response.merge(eloan_message: eloan_message)
        end
      end

      private

      def default_url
        if configurate.production?
          p chaxue
        else
          'https://mertest.cloudpnr.com/api/eloan'
        end
      end
    end
  end
end