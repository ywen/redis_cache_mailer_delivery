require 'action_mailer'
require 'redis_cache_mailer_delivery/version'
require 'redis_cache_mailer_delivery/settings'
require 'redis_cache_mailer_delivery/marshallable_converter_setting'
require 'redis_cache_mailer_delivery/cache_delivery'
require 'redis_cache_mailer_delivery/converters/sequel_marshallable_mail_message'
require 'redis_cache_mailer_delivery/deliveries'

module RedisCacheMailerDelivery
  class << self
    def install
      ActionMailer::Base.add_delivery_method :redis_cache, RedisCacheMailerDelivery::CacheDelivery,
        Settings.default_values
    end
  end # << self
end # RedisCacheMailerDelivery
require 'redis_cache_mailer_delivery/railtie'
require "redis_cache_mailer_delivery/version"
