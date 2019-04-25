module Eloan
  module Helper
    module Request
      ### 根据code获取请求方式,默认请求参数
      def request_params(code)
        case code
          when '101'
            {
              url: '/v1/users/add-cash-card',
              method: 'POST',
              notity: true,
              default: {
                'cert_type' => '00',
                'card_type' => 'D',
                'bg_return_url' => configurate.bg_return_url
              }
            }
          when '102'
            {
              url: '/v1/users/add-withhold-card',
              method: 'POST',
              notity: true,
              default: {
                'cert_type' => '00',
                'card_type' => 'D',
                'bg_return_url' => configurate.bg_return_url
              }
            }
          when '103'
            {
              url: '/v1/users/relieve-withhold-card',
              method: 'POST',
              default: {
                'cert_type' => '00'
              }
            }
          when '201'
            {
              url: '/v1/trade/loan',
              method: 'POST',
              notity: true,
              default: {
                'business_type' =>  '00',
                'product_type' => '00',
                'loan_purpose' => '00',
                'loan_period' => '1',
                'loan_period_type' => '01',
                'entrusted_flag' => 'N',
                'user_cert_type' => '00',
                'user_cash_method' => 'T1',
                'installment_number' => '1',
                'payment_method' => '02',
                'bg_return_url'  => configurate.bg_return_url
              }
            }
          when '202'
            {
              url: '/v1/trade/repay',
              method: 'POST',
              notity: true,
              default: {
                'business_type' => '00',
                'product_type' => '00',
                'cert_type' => '00',
                'repay_mode' => '0',
                'back_cert_type' => '00',
                'bg_return_url'  => configurate.bg_return_url
              }
            }

          when '204'
            {
              url: '/v1/trade/loan/cash',
              method: 'POST',
              notity: true,
              default: {
                'bg_return_url'  => configurate.bg_return_url
              }
            }
          when '301'
            {
              url: '/v1/users/query/add-cash-card',
              method: 'GET',
              default: {
                'cert_type' => '00'
              }
            }
          when '302'
            {
              url: '/v1/query/trade/loan',
              method: 'GET',
              default: {}
            }
          when '303'
            {
              url: '/v1/query/users/add-withhold-card',
              method: 'GET',
              default: {
                'cert_type' => '00'
              }
            }
          when '304'
            {
              url: '/v1/query/trade/repay',
              method: 'GET',
              default: {}
            }
          when '305'
            {
              url: '/v1/query/card/bin',
              method: 'GET',
              default: {}
            }
          when '306'
            {
              url: '/v1/query/bind/card',
              method: 'GET',
              default: {
                'cert_type' => '00'
              }
            }
          when '307'
            {
              url: '/v1/query/loan/cash',
              method: 'GET',
              default: {}
            }
          when '308'
            {
              url: '/v1/query/clients/balance',
              method: 'GET',
              default: {}
            }
        else
          {}
        end
      end
    end
  end
end