require 'uri'
require 'digest/sha1'

module FyberApiWrapper
  module RequestSigning
    def ordered_params_for_signing
      params_copy = params.dup
      params_copy.delete_if {|k,v| k.to_s == "hashkey" }
      Hash[params_copy.sort_by{|k,v| k.to_s}]
    end

    def signed_query_string
      #Get all request parameters and their values (except hashkey)
      #Order these pairs alphabetically by parameter name
      ordered_params = ordered_params_for_signing
      #Concatenate all pairs using = between key and value and & between the pairs.
      query_string = hash_to_query(ordered_params)
      # Concatenate the resulting string with & and the API Key handed out to you by Fyber.
      query_string_with_api_key = append_api_key(query_string)
      #Hash the whole resulting string, using SHA1
      digest = query_string_digest(query_string_with_api_key)
      #The resulting hashkey is then appended to the request as a separate parameter.
      ordered_params[:hashkey] = digest
      # In case some parameters have to be url-encoded, the entire hash calculation has to be done before this encoding => encode now
      hash_to_query(ordered_params, true)
    end

    def query_string_digest(query_string)
      Digest::SHA1.hexdigest(query_string)
    end

    def hash_to_query(hsh, encode = false)
      encode ? URI.encode(hsh.map{|k,v| "#{k}=#{v}"}.join("&")) : hsh.map{|k,v| "#{k}=#{v}"}.join("&")
    end

    def append_api_key(str)
      str.dup << "&" << ::FyberApiWrapper.configuration.api_key
    end

  end
end