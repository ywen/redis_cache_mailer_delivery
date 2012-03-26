module RedisCacheMailerDelivery
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
      settings[:marshallable_converters].each do |setting|
        mail = MarshallableConverterSetting.new(setting).marshallable_class.marshallable(mail)
      end
      list << mail
    end

  end # CacheDelivery
end # Mail
