require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

module RedisCacheMailerDelivery
  describe Deliveries do
    
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
