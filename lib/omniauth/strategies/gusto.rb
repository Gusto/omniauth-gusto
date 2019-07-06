# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Gusto < OmniAuth::Strategies::OAuth2
      option :name, 'gusto'

      # Options can be overridden in OmniAuth config initialization

      option(
        :client_options,
        site: 'https://api.gusto.com/',
        authorize_url: '/oauth/authorize',
        token_url: '/oauth/token'
      )

      option :authorize_options, %i[redirect_uri response_type]

      # Response phase
      #
      # Following params are returned:
      #   uid: Gusto user id of the user that initiated the authentication request
      #   info:
      #     email: Gusto email of the user
      #     name: Gusto email of the user
      #
      # See https://docs.gusto.com/ for detailed info about Gusto's API

      uid do
        raw_info['id']
      end

      info do
        { 'email' => raw_info['email'] }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      private

      def callback_url
        full_host + script_name + callback_path
      end

      def raw_info
        @raw_info ||= access_token.get('/v1/me').parsed
      end
    end
  end
end
