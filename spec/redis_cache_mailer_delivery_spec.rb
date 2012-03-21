require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe RedisCacheMailerDelivery do
  describe ".install" do
    it "adds a delivery method to the ActionMailer" do
      described_class.install
      ActionMailer::Base.delivery_methods.should include(:redis_cache => Mail::CacheDelivery)
    end
  end
end
