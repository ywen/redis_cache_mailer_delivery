require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

module RedisCacheMailerDelivery
  describe Deliveries do
    before(:each) do
      RedisCacheMailerDelivery.install
      Redis.current = Redis.new(:host => '127.0.0.1', :port => 6379)
    end
    
    describe ".all" do
      let(:object) { Mail::Message.new}
      before(:each) do
        list = Redis::List.new "redis_cache_mailer_delivery:mail_messages", :marshal => true
        list << object
      end

      after(:each) do
        Redis.current.del "redis_cache_mailer_delivery:mail_messages"
      end
      
      it "fetches all contents from redis" do
        described_class.all.size.should eq(1)
      end
      
      it "deserizlize the data" do
        described_class.all[0].should eq(object)
      end
    end
  end
end
