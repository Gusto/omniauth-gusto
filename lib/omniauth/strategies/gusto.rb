require 'omniauth-oauth2'
require 'pry'

module OmniAuth
  module Strategies
    class Gusto < OmniAuth::Strategies::OAuth2
      option :name, 'gusto'

      # Options can be overridden in Omniauth config initialization
      option(
        :client_options,
        site:          'https://api.gusto-staging.com/',
        authorize_url: '/oauth/authorize',
        token_url:     '/oauth/token',
        )

      option :authorize_options, [:redirect_uri, :response_type]

      # Response phase
      #
      # Following params are returned:
      #   uid: Gusto user id of the user that initiated the authentication request.
      #   email: Gusto email of the user
      #
      # See https://docs.gusto.com/ for detailed info about gusto api

      uid do
        raw_info['id']
      end

      info do
        {
          email: raw_info['email'],
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      private

      def raw_info
        @_raw_info ||= access_token.get('/v1/me').parsed
      end
    end
  end
end
