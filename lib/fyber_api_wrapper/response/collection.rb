module FyberApiWrapper
  module Response
    class Collection
      attr_accessor :code, :message, :count, :pages, :information
      
      def initialize(hsh)
        @hsh = hsh
        populate_collection_info
      end

      protected

      attr_reader :hsh
      
      def populate_collection_info
        @code = hsh.fetch("code")
        @message = hsh.fetch("message")
        @count = hsh.fetch("count")
        @pages = hsh.fetch("pages")
        @information = CollectionInformation.new(*hsh.fetch("information").values)
      end

    end
    #since no special logic is required here, a simple struct will do
    CollectionInformation = Struct.new(:app_name, :appid, :virtual_currency, :country, :language, :support_url) 
    
  end
end