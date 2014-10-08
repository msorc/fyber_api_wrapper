# FyberApiWrapper

This gem wraps over the [Fyber Offer Wall API](http://developer.fyber.com/content/ios/offer-wall/offer-api/ "Fyber Offer Wall API") and provides you with a simple way to query the offers from your Ruby app.

For now, although you can set some other format, *only JSON* will be parsed correctly.

## Installation

Add this line to your application's Gemfile:

    gem 'fyber_api_wrapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fyber_api_wrapper

## Usage

### Configuration

The Fyber API requires a few parameters to be set, namely:
  * appid
  * format
  * device_id
  * locale
  * ip
  * offer_types
  * api_key

In your app, configure the FyberApiWrapper and supply those parameters:

```ruby

  require 'fyber_api_wrapper'

  FyberApiWrapper.configure do |config|
    config.format = :json
    config.appid = 123
    config.device_id = '"your device ID"' # MIND THE QUOTES. device ID has quotes.
    config.ip = "1.2.3.4"
    config.offer_types = [112]
    config.api_key = "your-api-key"
  end

```
**NOTE:** Since the api_key is confidential, treat it accordingly. For example, use environment variables, do not put it on github for everyone to see.

### Performing requests and processing request results

Having configured the gem, you can make requests and obtain offers:

```ruby

  require 'fyber_api_wrapper'
  
  # assuming you've configured the gem
  params = { :uid => "luc", :pub0 => "campaign1", :page => "1" }
  # use the shortcut. 
  # you could also do:
  # Request::Offer.new(params).get

  offers = FyberApiWrapper.get_offers(params)

  # get the offer info
  puts offers.count                           # 30
  puts offers.code                            # "OK"

  # meta inf
  puts offers.information.app_name            # "Demo iframe for publisher - do not touch"
  puts offers.information.virtual_currency    # "Coins"

  #offers 
  offer = offers[0]                           # FyberApiWrapper::Response::Offer
  puts offer.title                            # "Connect - Social Map & Address Book"
  puts offer.link                             # "http://api.sponsorpay.com/bd744b22cc10f7a3b13d5d661cbd9ba5/fb707b4efdaa5b5f/mobile/DE/157/offers/275789"

  # offer types for this offer
  puts offer.offer_types.first.offer_type_id  # 101
  puts offer.offer_types.first.readable       # "Download"

  # time to payout for this offer
  puts offer.time_to_payout.amount            # 3300
  puts offer.time_to_payout.readable          # "1 hour"

  # thumbnails
  puts offer.thumbnail.lowres                 # "http://cdn1.sponsorpay.com/app_icons/20264/small_mobile_icon.png"
  puts offer.thumbnail.hires                  # "http://cdn1.sponsorpay.com/app_icons/20264/big_mobile_icon.png"

  # iterate over the offer items provided by the offers collection
  offers.each do |offer|
    puts offer.title
  end

```


## FAQ

Q: I did everything as described and I'm getting "NoMethodError: undefined method `appid' for nil:NilClass" when trying to execute FyberApiWrapper.get_offers(params)

A: You must have forgotten to configure the FyberApiWrapper. See Configuration above

## Contributing

1. Fork it ( https://github.com/yurivm/fyber_api_wrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
