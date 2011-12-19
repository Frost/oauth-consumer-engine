OauthConsumerEngine
===================

OauthConsumerEngine is a Rails Engine containing an omniauth consumer and that provides an authentication framework for your rails plugin.

You can use this if you have multiple rails applications but want a centralized login system (kind of like CAS).

By using this approach you can however stay logged into all of the different applications at the same time, 
and have your authentication provider use other cool login methods, such as:

* Facebook
* Twitter
* LinkedIn
* Google


This is still work in progress, and is based on [joshsoftware/sso-devise-omniauth-client](https://github.com/joshsoftware/sso-devise-omniauth-client).

Installation
============

This rails is only tested with ruby 1.9.2, rails 3.1 and omniauth 1.0.0.

Simply add this to your gemfile:

    gem 'auth-consumer-engine', git: "https://github.com/Frost/oauth-consumer-engine.git"

The `User` model is at the moment dependent on that you have a local users table, containing `uid`, `first_name`, `last_name` and `status` (and timestamps).
I plan on making the user model use ReactiveResource or something similar instead, to make it even more flexible.

Then just run

    bundle install
    bundle exec rake oauth_consumer_engine:install

Then you need to edit the `config/initializers/oauth_consumer_engine.rb` and set a few variables

* `custom_provider_url` -- Where your oauth provider lives (e.g. https://my.custom.oauth.provider.com)
* `app_id` -- Your registered app id.
* `app_secret` -- Your registered app secret.

That's it.

Inspired by...
==============

The actual oauth code in here is mostly borrowed from https://github.com/joshsoftware/sso-devise-omniauth-client.
The gem/engine fanciness (generators/rake tasks/templates) are inspired by (among others):

* plataformatec/devise
* sferik/rails_admin

