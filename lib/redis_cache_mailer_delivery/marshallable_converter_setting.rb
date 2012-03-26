module RedisCacheMailerDelivery
  class MarshallableConverterSetting
    attr_reader :converter_name
    class << self
      def builtin_settings
        { :sequel_record_marshallable => Mail::SequelMarshallableMailMessage }
      end
    end

    def initialize(converter_name)
      @converter_name = converter_name
    end

    def marshallable_class
      builtin_class = self.class.builtin_settings[converter_name]
      builtin_class.nil? ? converter_name : builtin_class
    end
  end
end
