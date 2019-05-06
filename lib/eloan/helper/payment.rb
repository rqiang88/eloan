module Eloan
  module Helper
    module Payment
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
      # 生成长度为28的流水
      def generate_request_seq
        _ljust = 14 - configurate.platform.length
        configurate.platform + Time.now.strftime("%Y%m%d%H%M%S") + rand(1000 * 1000).to_s.rjust(_ljust, '0')
      end

      # 生成请求日期
      def generate_request_date
        Date.today.strftime("%Y%m%d")
      end
    end
  end
end
