module RedisCacheMailerDelivery 
  class Railtie < Rails::Railtie

    #
    # Make settings available before configuration:
    #
    # @example
    #   config.action_mailer.delivery_method = :redis_cache
    #   config.action_mailer.cache_settings = { redis_key_name => "redis_cache_mailer_delivery:mail_messages" }
    #
    config.before_configuration do
      RedisCacheMailerDelivery.install
    end

  end # Railtie
end
