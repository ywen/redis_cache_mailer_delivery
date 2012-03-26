require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe RedisCacheMailerDelivery do
  describe ".install" do
    it "adds a delivery method to the ActionMailer" do
      described_class.install
      ActionMailer::Base.delivery_methods.should include(:redis_cache => Mail::CacheDelivery)
    end

    it "defaults the redis_key_name to redis_cache_mailer_delivery:mail_messages" do
      described_class.install
      ActionMailer::Base.redis_cache_settings[:redis_key_name].should eq('redis_cache_mailer_delivery:mail_messages')
    end

    it "defaults the marshallable converters to empty array" do
      described_class.install
      ActionMailer::Base.redis_cache_settings[:marshallable_converters].should eq([])
    end
  end
end
