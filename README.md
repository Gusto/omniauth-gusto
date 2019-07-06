# OmniAuth Gusto

Official OmniAuth strategy for authenticating with [Gusto](https://gusto.com/) using [Gusto’s API](https://docs.gusto.com/).

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

Integrate the strategy into your middleware. Refer to [Devise’s documentation](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview) if using Devise.

```ruby
# config/initializers/omniauth.rb

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :gusto, ENV['GUSTO_CLIENT_ID'], ENV['GUSTO_CLIENT_SECRET']
end
```

The route `/auth/gusto` will become available to initiate authentication.
Set up the callback route `/auth/gusto/callback` and tie to a controller action
to handle any post-authentication actions.

```ruby
# config/routes.rb

Rails.application.routes.draw do
  get '/auth/gusto/callback', to: 'sample_controller#gusto'
end

```

For more information on how to use OmniAuth, refer to the [OmniAuth documentation](https://github.com/omniauth/omniauth).

## Gusto’s API
Use the access token from the Auth Hash `request.env['omniauth.auth']['credentials']['token']` to
make calls to other [Gusto API](https://docs.gusto.com/) endpoints
such as [payrolls](https://docs.gusto.com/v1/payrolls).
To gain access to Gusto’s API, [contact Gusto](https://gusto.com/about/contact) to establish a client id and secret.

## Sample Response

Below is an example Auth Hash availble in `request.env['omniauth.auth']`

```ruby
{
  "provider" => "gusto",
  "uid" => 123,
  "info" => {
    "email" => "example.user@gmail.com",
    "name" => "example.user@gmail.com"
  },
  "credentials" => {
    "token" => "456",
    "refresh_token" => "789",
    "expires_at" => 1561589955,
    "expires" => true
  },
  "extra" => {
    "raw_info" => {
      "id" => 123,
      "email" => "example.user@gmail.com",
      "roles" => {
        "payroll_admin" => {
          "companies" => [
            {
              "id" => 101112,
              "name" => "Poi's Doughnuts",
              "trade_name" => null,
              "locations" => [
                {
                  "id" => 131415,
                  "street_1" => "1236 Mission St",
                  "street_2" => "",
                  "city" => "San Francisco",
                  "state" => "CA",
                  "zip" => "94103",
                  "country" => "USA",
                  "active" => true
                }
              ]
            }
          ]
        }
      }
    }
  }
}
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
