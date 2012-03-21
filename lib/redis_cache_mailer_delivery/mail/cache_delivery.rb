module Mail
  #
  # Performs deliveries to temporary cache file, so mails can accessed from
  # other processes.
  #
  # Default location of files is:
  #   -  "tmp/cache/action_mailer_cache_deliveries.cache" if you use Rails
  #   - "/tmp/cache/action_mailer_cache_deliveries.cache" if you don't use Rails
  #
  # However, you can overwrite location in configuration:
  #
  # @example
  #   config.action_mailer.cache_settings = { location: "custom/path" }
  #
  class CacheDelivery

    # @attr [Hash] settings Settings for CacheDelivery
    attr_accessor :settings

    # @api private
    def initialize(settings)
      @settings = settings
    end

    # @api private
    def deliver!(mail)
      list = Redis::List.new settings[:redis_key_name], :marshal => true
      list << mail
    end

  end # CacheDelivery
end # Mail
