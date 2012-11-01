require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class EngineId < OmniAuth::Strategies::OAuth2
      option :name, "engine_id"
      option :client_options, { :site => OauthConsumerEngine.config.custom_provider_url }

      uid { raw_info['uid'] }
      info { raw_info['info'] }
      extra { {'admin' => raw_info['admin'], 'raw_info' => raw_info} }


      # Overrides the default request_phase method of the OAuth2 strategy
      # Adds a extra parameter called initial_page sent to the OAuth provider, this is specific for the studentcompetition login provider
      def request_phase
        # Allowed values for the initial_page param is sign_up or sign_in or no value
        initial_page = @request.params[:initial_page] || "sign_in"
        redirect client.auth_code.authorize_url({:redirect_uri => callback_url, :initial_page => initial_page}.merge(authorize_params))
      end

      def raw_info
        @raw_info ||= access_token.get("/auth/engine_id/user.json?oauth_token=#{access_token.token}").parsed
      end
    end
  end
end
