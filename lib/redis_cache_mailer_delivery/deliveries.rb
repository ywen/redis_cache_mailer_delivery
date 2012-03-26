require 'redis'
require 'redis/objects'
require 'redis/list'
module RedisCacheMailerDelivery
  module Deliveries
    class << self

      #
      # Returns an array of delivered mails.
      #
      # @return [Array] array of mails (each mail is an instance of Mail.)
      #
      def all
        settings = Settings.new ActionMailer::Base.redis_cache_settings
        list = Redis::List.new settings.redis_key_name, :marshal => true
        list.values
      end
    end 
  end
end
