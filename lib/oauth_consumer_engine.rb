require "oauth_consumer_engine/version"
require "omniauth"

module OauthConsumerEngine
  if defined?(Rails)
    require 'oauth_consumer_engine/engine' 
    require "oauth_consumer_engine/helpers/controller_helpers"
    require "oauth_consumer_engine/helpers/view_helpers"
    require "oauth_consumer_engine/config"
  end

  mattr_accessor :config
  @@config = OauthConsumerEngine::Config.new

  def self.setup(&block)
    yield @@config
  end
end
