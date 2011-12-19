namespace :oauth_consumer_engine do
  desc "Install OauthConsumerEngine"
  task :install do
    system 'rails g oauth_consumer_engine:install'
  end

  desc "Uninstall OauthConsumerEngine"
  task :uninstall do
    system 'rails g oauth_consumer_engine:uninstall'
  end
end
