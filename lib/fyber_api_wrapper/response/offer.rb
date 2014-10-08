module FyberApiWrapper
  module Response
    class Offer
      attr_reader :title, :offer_id, :teaser, :required_actions, :link, :payout, :store_id, :offer_types, :time_to_payout, :thumbnail
      
      def initialize(hsh)
        @title              = hsh.fetch("title")
        @offer_id           = hsh.fetch("offer_id")
        @teaser             = hsh.fetch("teaser")
        @required_actions   = hsh.fetch("required_actions")
        @link               = hsh.fetch("link")
        @payout             = hsh.fetch("payout")
        @store_id           = hsh.fetch("store_id")
        @offer_types        = populate_offer_types(hsh.fetch("offer_types"))     
        @time_to_payout     = TimeToPayout.new(*hsh.fetch("time_to_payout").values)
        @thumbnail          = Thumbnail.new(*hsh.fetch("thumbnail").values)
      end

      private

      def populate_offer_types(offers)
        offers.map { |o| OfferType.new(*o.values) }
      end
    end

    OfferType    = Struct.new(:offer_type_id, :readable)
    TimeToPayout = Struct.new(:amount, :readable)
    Thumbnail    = Struct.new(:lowres, :hires)
  end
end