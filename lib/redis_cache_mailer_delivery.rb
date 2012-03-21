require 'redis_cache_mailer_delivery/version'
require 'redis_cache_mailer_delivery/mail/cache_delivery'
require 'redis_cache_mailer_delivery/action_mailer/base'

module RedisCacheMailerDelivery
  class << self
    def install
      ActionMailer::Base.add_delivery_method :redis_cache, Mail::CacheDelivery,
        :redis_key_name => "redis_cache_mailer_delivery:mail_messages"
    end

  end # << self
end # RedisCacheMailerDelivery
require 'redis_cache_mailer_delivery/railtie' if defined?(Rails)
require "redis_cache_mailer_delivery/version"
