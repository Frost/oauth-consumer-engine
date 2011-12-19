module ActionDispatch::Routing
  class Mapper
    def oauth_consumer_engine
      mount OauthConsumerEngine::Engine => "/login", :as => "oauth_engine"
    end
  end
end
