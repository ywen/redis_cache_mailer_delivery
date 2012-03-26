module RedisCacheMailerDelivery
  class Settings
    class << self
      def default_values
      {:redis_key_name => "redis_cache_mailer_delivery:mail_messages",
        :marshallable_converters => []}
      end
    end
    def initialize(settings)
      self.class.default_values.merge(settings).each do |key, value|
        self.class.send(:define_method, key) {value}
      end
    end
  end
end
