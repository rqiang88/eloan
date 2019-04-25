module Eloan
  module Helper
    module Service
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
          if request_params(response_code.first(3))[:notify] && response_code.last(2).to_s == '00'
            status, code, message = 'success', 201, '处理中'
          else
            message = response['bind_error_message'].present? ? response['bind_error_message'] : response['response_message']
            status, code = 'fail', 202
          end
        end
        {status: status, code: code, message: message, data: response}
      end

      private

      def default_url
        if production?
        else
          'https://mertest.cloudpnr.com/api/eloan'
        end
      end

      def production?
        configurate.env == 'production'
      end
    end
  end
end