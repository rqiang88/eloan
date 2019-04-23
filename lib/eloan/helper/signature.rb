module Eloan
  module Helper
    module Signature
      def generate(data)
        digest = OpenSSL::Digest.new('SHA256')
        OpenSSL::HMAC.hexdigest(digest, configurate.key, data)
      end

      def verify?
      end
    end
  end
end