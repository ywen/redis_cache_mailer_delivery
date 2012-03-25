module Mail
  #
  # Performs deliveries to redis storage, so mails can accessed from
  # other processes.
  #
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
      object = mail.respond_to?(:marshallable!) ? mail.marshallable! : mail
      list << object
    end

  end # CacheDelivery
end # Mail
