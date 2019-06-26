# OmniAuth Gusto

Official OmniAuth strategy for [Gusto API](https://docs.gusto.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-gusto'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-gusto

## Usage

Integrate the strategy into your middleware. Refer to OmniAuth documentation if using Devise.

```ruby
# config/initializers/omniauth.rb

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :gusto, ENV['GUSTO_CLIENT_ID'], ENV['GUSTO_CLIENT_SECRET']
end
```

To use Gusto's API, contact Gusto for establishing a client id and secret.

For more information on how to use OmniAuth, refer to the [OmniAuth documentation](https://github.com/omniauth/omniauth).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
