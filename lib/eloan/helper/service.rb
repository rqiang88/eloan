module Eloan
  module Helper
    module Service
      def handle_data(request_method, url, params)
        data = [request_method, handle_url(url), handle_params(params)] * ''
        URI.escape data.force_encoding('UTF-8')
      end

      def request_url(url='')
        [default_url, url] * '/'
      end

      def default_url
        if production?
        else
          'https://mertest.cloudpnr.com/api/eloan'
        end
      end

      private

      def handle_params(params)
        data = params.sort.map do |k, v|
          "#{k}=#{v}" if v.present?
        end
        data.compact * '&'
      end

      def handle_url(url)
        configurate.url + url
      end

      def production?
        configurate.env == 'production'
      end
    end
  end
end