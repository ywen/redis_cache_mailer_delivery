module ActionMailer
  class Base
    class << self

      #
      # Returns an array of delivered mails.
      #
      # @return [Array] array of mails (each mail is an instance of Mail.)
      #
      def cached_deliveries
        list = Redis::List.new redis_cache_settings[:redis_key_name], :marshal => true
        list.values.map{|m|Marshal.load(m)}
      end

      #
      # Clears delivered mails.
      #
      # It also cleans ActionMailer::Base.deliveries
      #
      def clear_cache
        $redis.del redis_cache_settings[:redis_key_name]
      end

    end # << self
  end # Base
end # ActionMailer
