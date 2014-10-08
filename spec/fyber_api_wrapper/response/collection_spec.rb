require 'spec_helper'

describe FyberApiWrapper::Response::Collection do
  let(:json_with_offers) {
  {"code"=>"OK",
   "message"=>"Ok",
   "count"=>30,
   "pages"=>5,
   "information"=>
    {"app_name"=>"Demo iframe for publisher - do not touch",
     "appid"=>157,
     "virtual_currency"=>"Coins",
     "country"=>"DE",
     "language"=>"EN",
     "support_url"=>
      "http://api.sponsorpay.com/support?appid=157&feed=on&mobile=on&uid=luc"},
   "offers"=>
    [{"title"=>"Connect - Social Map & Address Book",
      "offer_id"=>275789,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/379955e57bd687f4/mobile/DE/157/offers/275789",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>30215,
      "time_to_payout"=>{"amount"=>3300, "readable"=>"1 hour"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn1.sponsorpay.com/app_icons/20264/small_mobile_icon.png",
        "hires"=>
         "http://cdn1.sponsorpay.com/app_icons/20264/big_mobile_icon.png"},
      "store_id"=>"688695759"},
     {"title"=>"Katalog Kiosk",
      "offer_id"=>99852,
      "teaser"=>
       "Melde dich für Newsletter deiner Wahl an und bestätige deine Email",
      "required_actions"=>
       "Melde dich für Newsletter deiner Wahl an und bestätige deine Email",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/49b653501de84afd/mobile/DE/157/offers/99852",
      "offer_types"=>
       [{"offer_type_id"=>105, "readable"=>"Registration"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>11987,
      "time_to_payout"=>{"amount"=>2700, "readable"=>"1 hour"},
      "thumbnail"=>
       {"lowres"=>"http://cdn1.sponsorpay.com/assets/71/kiosk_square_60.gif",
        "hires"=>"http://cdn1.sponsorpay.com/assets/71/kiosk_square_175.gif"},
      "store_id"=>""},
     {"title"=>"Candy Slide",
      "offer_id"=>287747,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/15b4083407724d96/mobile/DE/157/offers/287747",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>482,
      "time_to_payout"=>{"amount"=>0, "readable"=>"1 minute"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn3.sponsorpay.com/app_icons/20465/small_mobile_icon.png",
        "hires"=>
         "http://cdn3.sponsorpay.com/app_icons/20465/big_mobile_icon.png"},
      "store_id"=>""},
     {"title"=>"Dragon Fire Empire",
      "offer_id"=>298388,
      "teaser"=>"Download and REGISTER an account",
      "required_actions"=>"Download and REGISTER an account",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/d2926f965eef266b/mobile/DE/157/offers/298388",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>482,
      "time_to_payout"=>{"amount"=>0, "readable"=>"1 minute"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn3.sponsorpay.com/assets/45029/Screen_Shot_2014-07-23_at_4.42.19_PM_square_60.png",
        "hires"=>
         "http://cdn3.sponsorpay.com/assets/45029/Screen_Shot_2014-07-23_at_4.42.19_PM_square_175.png"},
      "store_id"=>""},
     {"title"=>"Grepolis - Jetzt kostenlos spielen!",
      "offer_id"=>144666,
      "teaser"=>
       "Registriere dich mit korrekten Daten und spiele bis du 500 Punkte erreichst",
      "required_actions"=>
       "Registriere dich mit korrekten Daten und spiele bis du 500 Punkte erreichst",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/8af3c80b070e2e04/mobile/DE/157/offers/144666/preview",
      "offer_types"=>
       [{"offer_type_id"=>105, "readable"=>"Registration"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>119869,
      "time_to_payout"=>{"amount"=>11100, "readable"=>"3 hours"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn4.sponsorpay.com/assets/9920/Grepolis_square_60.png",
        "hires"=>
         "http://cdn4.sponsorpay.com/assets/9920/Grepolis_square_175.png"},
      "store_id"=>""},
     {"title"=>"Schloss Konflikt: Castle Clash",
      "offer_id"=>142068,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/9a8e7032d77fb31a/mobile/DE/157/offers/142068",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>22659,
      "time_to_payout"=>{"amount"=>3000, "readable"=>"1 hour"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn3.sponsorpay.com/app_icons/6516/small_mobile_icon.png",
        "hires"=>
         "http://cdn3.sponsorpay.com/app_icons/6516/big_mobile_icon.png"},
      "store_id"=>"com.igg.castleclash_de"},
     {"title"=>"Slots™",
      "offer_id"=>123188,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/434c36470ae592b9/mobile/DE/157/offers/123188",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>107, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>5581,
      "time_to_payout"=>{"amount"=>3000, "readable"=>"1 hour"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn2.sponsorpay.com/app_icons/2068/small_mobile_icon.png",
        "hires"=>
         "http://cdn2.sponsorpay.com/app_icons/2068/big_mobile_icon.png"},
      "store_id"=>"com.sharkparty.slots"},
     {"title"=>"Hotels.com HD – Hotel Booking and l",
      "offer_id"=>71288,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/fef03b68b9c6da0a/mobile/DE/157/offers/71288",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>95867,
      "time_to_payout"=>{"amount"=>1200, "readable"=>"20 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn2.sponsorpay.com/app_icons/620/small_mobile_icon.png",
        "hires"=>"http://cdn2.sponsorpay.com/app_icons/620/big_mobile_icon.png"},
      "store_id"=>"461327349"},
     {"title"=>"Fashion Story™",
      "offer_id"=>58869,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/4b3cd3f8fe4d4642/mobile/DE/157/offers/58869",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>5581,
      "time_to_payout"=>{"amount"=>4200, "readable"=>"1 hour"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn2.sponsorpay.com/app_icons/117/small_mobile_icon.png",
        "hires"=>"http://cdn2.sponsorpay.com/app_icons/117/big_mobile_icon.png"},
      "store_id"=>"com.teamlava.fashionstory"},
     {"title"=>"o2 Gratis Prepaid-Karte mit Bonus",
      "offer_id"=>39362,
      "teaser"=>
       "Fordere mit deinen korrekten Daten das Angebot an! Bestätige die Bestellung",
      "required_actions"=>
       "Fordere mit deinen korrekten Daten das Angebot an! Bestätige die Bestellung",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/c63bce707995b244/mobile/DE/157/offers/39362",
      "offer_types"=>
       [{"offer_type_id"=>105, "readable"=>"Registration"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>86530,
      "time_to_payout"=>{"amount"=>600, "readable"=>"10 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn3.sponsorpay.com/assets/15196/offerwall-02_square_60.jpg",
        "hires"=>
         "http://cdn3.sponsorpay.com/assets/15196/offerwall-02_square_175.jpg"},
      "store_id"=>""},
     {"title"=>"Game of War - Fire Age",
      "offer_id"=>351263,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/e4bb949f4f513d5d/mobile/DE/157/offers/351263",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>14450,
      "time_to_payout"=>{"amount"=>900, "readable"=>"15 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn2.sponsorpay.com/app_icons/6111/small_mobile_icon.png",
        "hires"=>
         "http://cdn2.sponsorpay.com/app_icons/6111/big_mobile_icon.png"},
      "store_id"=>"667728512"},
     {"title"=>"iHotel – Hotel Search",
      "offer_id"=>363338,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/dd19f91747d8eb81/mobile/DE/157/offers/363338",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>21675,
      "time_to_payout"=>{"amount"=>1800, "readable"=>"30 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn1.sponsorpay.com/app_icons/3325/small_mobile_icon.png",
        "hires"=>
         "http://cdn1.sponsorpay.com/app_icons/3325/big_mobile_icon.png"},
      "store_id"=>"332193586"},
     {"title"=>"Castle Clash",
      "offer_id"=>352466,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/91cf3a3dedc92e56/mobile/DE/157/offers/352466",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>12042,
      "time_to_payout"=>{"amount"=>600, "readable"=>"10 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn3.sponsorpay.com/app_icons/6078/small_mobile_icon.png",
        "hires"=>
         "http://cdn3.sponsorpay.com/app_icons/6078/big_mobile_icon.png"},
      "store_id"=>"com.igg.castleclash"},
     {"title"=>"Cradle of Empires",
      "offer_id"=>356987,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/de93822b35306068/mobile/DE/157/offers/356987",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>36126,
      "time_to_payout"=>{"amount"=>3300, "readable"=>"1 hour"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn3.sponsorpay.com/app_icons/9587/small_mobile_icon.png",
        "hires"=>
         "http://cdn3.sponsorpay.com/app_icons/9587/big_mobile_icon.png"},
      "store_id"=>"738480930"},
     {"title"=>"lieferando - Pizza, Burger, Sushi, ",
      "offer_id"=>357503,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/ba09359ee39b9a72/mobile/DE/157/offers/357503",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>19267,
      "time_to_payout"=>{"amount"=>0, "readable"=>"1 minute"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn4.sponsorpay.com/app_icons/18538/small_mobile_icon.png",
        "hires"=>
         "http://cdn4.sponsorpay.com/app_icons/18538/big_mobile_icon.png"},
      "store_id"=>"419724490"},
     {"title"=>"mobile.de - mobile Auto Börse",
      "offer_id"=>363035,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/a2b8c03561fb083c/mobile/DE/157/offers/363035",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>26492,
      "time_to_payout"=>{"amount"=>1800, "readable"=>"30 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn2.sponsorpay.com/app_icons/3807/small_mobile_icon.png",
        "hires"=>
         "http://cdn2.sponsorpay.com/app_icons/3807/big_mobile_icon.png"},
      "store_id"=>"de.mobile.android.app"},
     {"title"=>"Help Me Jack: Atomic Adventure",
      "offer_id"=>362381,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/6b34adbd6cb02268/mobile/DE/157/offers/362381",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>6971,
      "time_to_payout"=>{"amount"=>300, "readable"=>"5 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn4.sponsorpay.com/app_icons/27023/small_mobile_icon.png",
        "hires"=>
         "http://cdn4.sponsorpay.com/app_icons/27023/big_mobile_icon.png"},
      "store_id"=>"com.nhnent.SKJACK"},
     {"title"=>"Born to be Rich Slot Machine",
      "offer_id"=>353168,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/0dcf885b01b7e076/mobile/DE/157/offers/353168",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>107, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>12042,
      "time_to_payout"=>{"amount"=>13500, "readable"=>"4 hours"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn1.sponsorpay.com/app_icons/26486/small_mobile_icon.png",
        "hires"=>
         "http://cdn1.sponsorpay.com/app_icons/26486/big_mobile_icon.png"},
      "store_id"=>"480095719"},
     {"title"=>"Castle Clash",
      "offer_id"=>352343,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/2f0cce2cb803a8ce/mobile/DE/157/offers/352343",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>16398,
      "time_to_payout"=>{"amount"=>3900, "readable"=>"1 hour"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn3.sponsorpay.com/app_icons/6078/small_mobile_icon.png",
        "hires"=>
         "http://cdn3.sponsorpay.com/app_icons/6078/big_mobile_icon.png"},
      "store_id"=>"com.igg.castleclash"},
     {"title"=>"Game of War - Fire Age",
      "offer_id"=>363026,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/01e309ae04a993c2/mobile/DE/157/offers/363026",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>19267,
      "time_to_payout"=>{"amount"=>1800, "readable"=>"30 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn2.sponsorpay.com/app_icons/6111/small_mobile_icon.png",
        "hires"=>
         "http://cdn2.sponsorpay.com/app_icons/6111/big_mobile_icon.png"},
      "store_id"=>"667728512"},
     {"title"=>"F-Secure Freedome VPN",
      "offer_id"=>363662,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/505b899b88727643/mobile/DE/157/offers/363662",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>24566,
      "time_to_payout"=>{"amount"=>1800, "readable"=>"30 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn3.sponsorpay.com/app_icons/19769/small_mobile_icon.png",
        "hires"=>
         "http://cdn3.sponsorpay.com/app_icons/19769/big_mobile_icon.png"},
      "store_id"=>"771791010"},
     {"title"=>"Star Wars: Commander",
      "offer_id"=>361385,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/c68b3647e1d2b655/mobile/DE/157/offers/361385",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>28543,
      "time_to_payout"=>{"amount"=>600, "readable"=>"10 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn4.sponsorpay.com/app_icons/22079/small_mobile_icon.png",
        "hires"=>
         "http://cdn4.sponsorpay.com/app_icons/22079/big_mobile_icon.png"},
      "store_id"=>"847985808"},
     {"title"=>"Cradle of Empires",
      "offer_id"=>352112,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/bfa85aaf6e5b0d36/mobile/DE/157/offers/352112",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>18827,
      "time_to_payout"=>{"amount"=>1800, "readable"=>"30 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn3.sponsorpay.com/app_icons/9587/small_mobile_icon.png",
        "hires"=>
         "http://cdn3.sponsorpay.com/app_icons/9587/big_mobile_icon.png"},
      "store_id"=>"738480930"},
     {"title"=>"Star Wars: Commander",
      "offer_id"=>361109,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/33a6b424ce27f8de/mobile/DE/157/offers/361109",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>24566,
      "time_to_payout"=>{"amount"=>1500, "readable"=>"25 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn4.sponsorpay.com/app_icons/22079/small_mobile_icon.png",
        "hires"=>
         "http://cdn4.sponsorpay.com/app_icons/22079/big_mobile_icon.png"},
      "store_id"=>"847985808"},
     {"title"=>"Titan Empires",
      "offer_id"=>358196,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/5cdd290210860932/mobile/DE/157/offers/358196",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>106, "readable"=>"Games"},
        {"offer_type_id"=>109, "readable"=>"Games"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>17664,
      "time_to_payout"=>{"amount"=>3600, "readable"=>"1 hour"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn4.sponsorpay.com/app_icons/23931/small_mobile_icon.png",
        "hires"=>
         "http://cdn4.sponsorpay.com/app_icons/23931/big_mobile_icon.png"},
      "store_id"=>"903398848"},
     {"title"=>"DU Battery Saver & Widgets",
      "offer_id"=>349952,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/ef9e7882d7c9f5a0/mobile/DE/157/offers/349952",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>7225,
      "time_to_payout"=>{"amount"=>900, "readable"=>"15 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn4.sponsorpay.com/app_icons/7085/small_mobile_icon.png",
        "hires"=>
         "http://cdn4.sponsorpay.com/app_icons/7085/big_mobile_icon.png"},
      "store_id"=>"com.dianxinos.dxbs"},
     {"title"=>"APUS Launcher－Small, Fast",
      "offer_id"=>353123,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/ecd9375e0faf63ae/mobile/DE/157/offers/353123",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>8670,
      "time_to_payout"=>{"amount"=>300, "readable"=>"5 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn3.sponsorpay.com/app_icons/21614/small_mobile_icon.png",
        "hires"=>
         "http://cdn3.sponsorpay.com/app_icons/21614/big_mobile_icon.png"},
      "store_id"=>"com.apusapps.launcher"},
     {"title"=>"APUS Launcher－Small, Fast",
      "offer_id"=>353126,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/92a5b39d4e64ccba/mobile/DE/157/offers/353126",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>7225,
      "time_to_payout"=>{"amount"=>600, "readable"=>"10 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn3.sponsorpay.com/app_icons/21614/small_mobile_icon.png",
        "hires"=>
         "http://cdn3.sponsorpay.com/app_icons/21614/big_mobile_icon.png"},
      "store_id"=>"com.apusapps.launcher"},
     {"title"=>"dailyme TV, Serien & Fernsehen",
      "offer_id"=>362150,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/21c82286bc277e40/mobile/DE/157/offers/362150",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>9634,
      "time_to_payout"=>{"amount"=>0, "readable"=>"1 minute"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn2.sponsorpay.com/app_icons/12121/small_mobile_icon.png",
        "hires"=>
         "http://cdn2.sponsorpay.com/app_icons/12121/big_mobile_icon.png"},
      "store_id"=>"tv.dailyme.android"},
     {"title"=>"mobile.de - mobile Auto Börse",
      "offer_id"=>353207,
      "teaser"=>"Download and START",
      "required_actions"=>"Download and START",
      "link"=>
       "http://api.sponsorpay.com/dfde3dfbb3c5d116375b4cc60b77fffe/d6bf74dc032c13a4/mobile/DE/157/offers/353207",
      "offer_types"=>
       [{"offer_type_id"=>101, "readable"=>"Download"},
        {"offer_type_id"=>112, "readable"=>"Free"}],
      "payout"=>25047,
      "time_to_payout"=>{"amount"=>300, "readable"=>"5 minutes"},
      "thumbnail"=>
       {"lowres"=>
         "http://cdn2.sponsorpay.com/app_icons/3807/small_mobile_icon.png",
        "hires"=>
         "http://cdn2.sponsorpay.com/app_icons/3807/big_mobile_icon.png"},
      "store_id"=>"de.mobile.android.app"}
    ]}
  }
  let(:json_without_offers) {
    {"code"=>"NO_CONTENT",
       "message"=>
        "Successful request, but no offers are currently available for this user.",
       "count"=>0,
       "pages"=>0,
       "information"=>
        {"app_name"=>"Demo iframe for publisher - do not touch",
         "appid"=>157,
         "virtual_currency"=>"Coins",
         "country"=>"DE",
         "language"=>"EN",
         "support_url"=>
          "http://api.sponsorpay.com/support?appid=157&feed=on&mobile=on&uid=luc"
        },
       "offers"=>[]
    }
  }
  let(:collection) { FyberApiWrapper::Response::Collection.new(json_with_offers) }
  let(:empty_collection) { FyberApiWrapper::Response::Collection.new(json_without_offers) }
  
  describe "#code" do
    it "provides the correct code value for the non-empty collection" do
      expect(collection.code).to eq("OK")
    end
    it "provides the correct code value for the empty collection" do
      expect(empty_collection.code).to eq("NO_CONTENT")
    end
    it "raises a KeyError if json doesn't contain the message key" do
      expect { FyberApiWrapper::Response::Collection.new({}).code }.to raise_error(KeyError)
    end
  end

  describe "#message" do
    it "provides the correct message value for the non-empty collection" do
      expect(collection.message).to eq("Ok")
    end
    it "provides the correct message value for the empty collection" do
      expect(empty_collection.message).to eq("Successful request, but no offers are currently available for this user.")
    end
    it "raises a KeyError if json doesn't contain the message key" do
      expect { FyberApiWrapper::Response::Collection.new({}).message }.to raise_error(KeyError)
    end
  end

  describe "#count" do
    it "provides the correct count value for the non-empty collection" do
      expect(collection.count).to eq(30)
    end
    it "provides the correct count value for the empty collection" do
      expect(empty_collection.count).to eq(0)
    end
    it "raises a KeyError if json doesn't contain the count key" do
      expect { FyberApiWrapper::Response::Collection.new({}).count }.to raise_error(KeyError)
    end
  end

  describe "#pages" do
    it "provides the correct pages value for the non-empty collection" do
      expect(collection.pages).to eq(5)
    end
    it "provides the correct pages value for the empty collection" do
      expect(empty_collection.pages).to eq(0)
    end
    it "raises a KeyError if json doesn't contain the pages key" do
      expect { FyberApiWrapper::Response::Collection.new({}).pages }.to raise_error(KeyError)
    end
  end

  describe "#information" do
    it "provides correct information if json has offers" do
      expect(empty_collection.information.app_name).to eq("Demo iframe for publisher - do not touch")
      expect(empty_collection.information.appid).to eq(157)
      expect(empty_collection.information.virtual_currency).to eq("Coins")
      expect(empty_collection.information.country).to eq("DE")
      expect(empty_collection.information.language).to eq("EN")
      expect(empty_collection.information.support_url).to eq("http://api.sponsorpay.com/support?appid=157&feed=on&mobile=on&uid=luc")        
    end
    it "provides correct information if json doesn't have any offers" do
      expect(empty_collection.information.app_name).to eq("Demo iframe for publisher - do not touch")
      expect(empty_collection.information.appid).to eq(157)
      expect(empty_collection.information.virtual_currency).to eq("Coins")
      expect(empty_collection.information.country).to eq("DE")
      expect(empty_collection.information.language).to eq("EN")
      expect(empty_collection.information.support_url).to eq("http://api.sponsorpay.com/support?appid=157&feed=on&mobile=on&uid=luc")        
    end
    it "raises a KeyError if json doesn't contain the information key" do
      expect { FyberApiWrapper::Response::Collection.new({}).information }.to raise_error(KeyError)
    end
  end

  describe "#offers" do
    it "returns an empty array for the empty collection" do
      expect(empty_collection.offers).to eq([])
    end
    it "returns an array of offers for a non-empty collection" do
      expect(collection.offers).to be_a(Array)
    end
    it "returns an array of Response::Offer elements" do
      collection.offers.each {|o| expect(o).to be_a(FyberApiWrapper::Response::Offer)}
    end
    it "returns an array of correct size" do
      expect(collection.offers.count).to eq(30)
    end
    it "populates the Offer attributes correctly" do
      o = collection.offers.last
      expect(o.title).to eq("mobile.de - mobile Auto Börse")
      expect(o.offer_id).to eq(353207)
      expect(o.offer_types).to be_a(Array)
      expect(o.offer_types.first).to be_a(FyberApiWrapper::Response::OfferType)
      expect(o.time_to_payout).to be_a(FyberApiWrapper::Response::TimeToPayout)
      expect(o.thumbnail).to be_a(FyberApiWrapper::Response::Thumbnail)
    end
  end

  describe "#[]" do
    it "calls offers[]" do
      o1 = collection.offers[1]
      expect(o1.title).to eq("Katalog Kiosk")
    end
  end

  describe "#each" do
    it "calls offers.each" do
      titles = collection.map do |offer|
        offer.title
      end
      expect(titles).to be_a(Array)
      expect(titles.first).to eq("Connect - Social Map & Address Book")
    end
    it "returns an enumerator if no block is given" do
      expect(collection.each).to be_a(Enumerator)
    end
  end

end