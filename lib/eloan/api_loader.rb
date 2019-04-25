module Eloan
  module ApiLoader
    class << self
      def with(config)
        raise "app_key not allow blank" if config.app_key.blank?
        raise "app_token not allow blank" if config.app_token.blank?
        raise "app_key not allow blank and length less then 7" if config.platform.blank? || config.platform.length > 6
        Client.new(config)
      end
    end
  end
end