require "rails/generators"

module OauthConsumerEngine
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../../oauth_consumer_engine/templates", __FILE__)

    desc "OauthConsumerEngine installation"
    def install
      copy_initializer
      setup_routes
    end

  private

    def setup_routes
      route("oauth_consumer_engine")
    end

    def copy_initializer
      template("oauth_consumer_engine.rb", "config/initializers/oauth_consumer_engine.rb")
    end
  end
end
