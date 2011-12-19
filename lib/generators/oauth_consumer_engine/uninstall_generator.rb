require "rails/generators"

module OauthConsumerEngine
  class UninstallGenerator < Rails::Generators::Base

    desc "OauthConsumerEngine uninstallation"
    def uninstall
      gsub_file "config/routes.rb", /^\s+oauth_consumer_engine\s*$/, ''
      remove_file "config/initializers/oauth_consumer_engine.rb"
    end
  end
end

