require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class EngineId < OmniAuth::Strategies::OAuth2
      option :name, "engine_id"
      option :client_options, { :site => OauthConsumerEngine.config.custom_provider_url }

      uid { raw_info['uid'] }
      info { raw_info['info'] }
      extra { {'admin' => raw_info['admin'], 'raw_info' => raw_info} }

      def raw_info
        @raw_info ||= access_token.get("/auth/engine_id/user.json?oauth_token=#{access_token.token}").parsed
      end
    end
  end
end
