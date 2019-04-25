module Eloan
  module Helper
    module Payment
      ### 生成公共请求参数

      # 生成默认参数
      def generate_default_params
        {
          app_token: configurate.app_token,
          client_name: configurate.client_name,
          company_name: configurate.company_name, 
          request_seq: generate_request_seq,
          request_date: generate_request_date
        }
      end

      private
      # 生成流水
      def generate_request_seq
        length = 6 - configurate.platform.length
        _ljust = 8 + length 
        configurate.platform + Time.now.strftime("%Y%m%d%H%M%S") + rand(1000 * 1000).to_s.rjust(_ljust, '0')
      end

      # 生成请求日期
      def generate_request_date
        Date.today.strftime("%Y%m%d")
      end
    end
  end
end
