require 'mail'
require 'mail/message'
module Mail
  module MarshallableMailMessage

    def marshallable
      return self unless self.respond_to?(:record)
      record.marshallable! if record.respond_to?(:marshallable!)
      self
    end
  end
end

Mail::Message.send(:include, Mail::MarshallableMailMessage)
