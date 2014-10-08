module FyberApiWrapper
  module RequestSigning
    def ordered_params_for_signing
      params_copy = params.dup
      params_copy.delete_if {|k,v| k.to_s == "hashkey" }
      Hash[params_copy.sort_by{|k,v| k.to_s}]
    end
  end
end