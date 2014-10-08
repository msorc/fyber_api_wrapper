module FyberApiWrapper
  module Response
    class Collection
      include Enumerable

      attr_accessor :code, :message, :count, :pages, :information, :offers
      
      def initialize(hsh)
        @hsh = hsh
        populate_collection_info
        populate_offers
      end

      def each(*args, &block)
        offers.each(*args, &block)
      end

      def [](key)
        offers[key]
      end

      def first
        offers[0]
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

      def populate_offers
        @offers = hsh.fetch("offers").map {|offer_hsh| Offer.new(offer_hsh)}
      end

    end
    #since no special logic is required here, a simple struct will do
    CollectionInformation = Struct.new(:app_name, :appid, :virtual_currency, :country, :language, :support_url) 

  end
end