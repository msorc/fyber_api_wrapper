require 'digest/sha1'

module FyberApiWrapper
  module Request
    module SignatureVerification
      def verify_response_signature!
        server_signature = signature_header_value || ""
        if server_signature.empty?
          $stderr.puts "WARNING: Missing server signature header. Be careful with the response data, they might have been tampered with." unless !!signature_header_value && !signature_header_value.empty?
        else
          our_signature = calculate_response_signature
          raise SignatureVerificationError, "Signature mismatch: the server returned #{server_signature}, local signature #{our_signature}" unless server_signature == our_signature
        end
      end

      def calculate_response_signature
        concatenated = response_body.dup << FyberApiWrapper.configuration.api_key
        Digest::SHA1.hexdigest(concatenated)
      end
    end
  end
end