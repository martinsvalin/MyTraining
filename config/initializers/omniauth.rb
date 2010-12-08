Rails.application.config.middleware.use OmniAuth::Builder do
  require 'memcached'
  require "openid/store/memcache"
  # provider :twitter, ENV['twitter_key'], ENV['twitter_secret']
  provider :GoogleApps, OpenID::Store::Memcache.new(Memcached::Rails.new), :domain => CONFIG['google_domain']
end