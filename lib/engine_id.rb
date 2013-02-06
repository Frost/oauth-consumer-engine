require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class EngineId < OmniAuth::Strategies::OAuth2
      option :name, "engine_id"
      option :client_options, { :site => OauthConsumerEngine.config.custom_provider_url }
      # Got CSRF error without this when calling the SC login portal
      option :provider_ignores_state, true

      uid { raw_info['uid'] }
      info { raw_info['info'] }
      extra { {'admin' => raw_info['admin'], 'raw_info' => raw_info} }


      # Overrides the default request_phase method of the OAuth2 strategy
      # Adds a extra parameter called initial_page sent to the OAuth provider, this is specific for the studentcompetition login provider
      def request_phase
        # For allowed values for the initial_page param, check the SC-API (The CustomFailure class)
        # Note that you have to access the @request.params hash with a string, otherwise it does not get any value.
        initial_page = @request.params["initial_page"] || "sign_in"
        redirect client.auth_code.authorize_url({:redirect_uri => encode_uri_if_necessary(callback_url), :initial_page => initial_page}.merge(authorize_params))
      end

      def raw_info
        @raw_info ||= access_token.get("/auth/engine_id/user.json?oauth_token=#{access_token.token}").parsed
      end

      def encode_uri_if_necessary(uri)
        URI.parse(uri).to_s
      rescue URI::InvalidURIError => e
        URI.encode(uri)
      end
    end
  end
end
