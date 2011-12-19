require "oauth_consumer_engine"
require "rails"
require "oauth_consumer_engine/rails/routes"

module OauthConsumerEngine

  class Engine < Rails::Engine
    initializer "oauth_consumer_engine.omniauth" do |app|
      # Change this omniauth configuration to point to your registered provider

      # Since this is a registered application, add the app id and secret here
      ENV['CUSTOM_PROVIDER_URL'] = OauthConsumerEngine.config.custom_provider_url
      require 'engine_id'
    
      Rails.application.config.middleware.use OmniAuth::Builder do
        provider :engine_id, OauthConsumerEngine.config.app_id, OauthConsumerEngine.config.app_secret
        puts "ENGINE_ID: #{OauthConsumerEngine.config.app_id}, #{OauthConsumerEngine.config.app_secret}"
      end
      
    end

    initializer "oauth_consumer_engine.secret_token" do |app|
      app.config.secret_token = 'e076c49b76898f0657f93ae1f6790a07bb84c1f8fcf0e299e85d874df7ea301e66d96fb32fe2e204aa4a569588250b9f792794a79d7894a191f3ad6318ed6974'
    end

    initializer "oauth_consumer_engine.session_store" do |app|
      app.config.session_store :cookie_store, :key => '_oauth-client-demo_session'
    end

    initializer "oauth_consumer_engine.helpers" do
      ActiveSupport.on_load(:action_controller) do
        include OauthConsumerEngine::Helpers
        include OauthConsumerEngine::Helpers::ControllerHelpers
        helper_method "current_user", "login_required", "user_signed_in?", "user_session"
      end

      ActionView::Base.send :include, OauthConsumerEngine::Helpers::ViewHelpers
    end

  end
end
