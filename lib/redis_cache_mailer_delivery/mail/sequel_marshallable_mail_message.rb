module Mail
  module SequelMarshallableMailMessage
    class << self
      def marshallable(object)
        return object unless object.respond_to?(:record)
        object.record.marshallable! if object.record.respond_to?(:marshallable!)
        object
      end
    end
  end
end
