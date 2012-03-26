require 'action_mailer'
require 'redis_cache_mailer_delivery/version'
require 'redis_cache_mailer_delivery/mail/cache_delivery'
require 'redis_cache_mailer_delivery/mail/sequel_marshallable_mail_message'
require 'redis_cache_mailer_delivery/deliveries'

module RedisCacheMailerDelivery
  class << self
    def install
      ActionMailer::Base.add_delivery_method :redis_cache, Mail::CacheDelivery,
        :redis_key_name => "redis_cache_mailer_delivery:mail_messages",
        :marshallable_converters => []
    end

  end # << self
end # RedisCacheMailerDelivery
require 'redis_cache_mailer_delivery/railtie'
require "redis_cache_mailer_delivery/version"
