require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "spec_helper"))

module Mail
  describe CacheDelivery do
    subject {described_class.new :redis_key_name => "a-name"}
    describe "#deliver!" do
      let(:object) {Mail::Message.new}

      after(:each) do
        Redis.current.del "a-name"
      end
      it "puts a object into the redis store" do
        subject.deliver!(object)
        Redis::List.new("a-name", :marshal => true).values[0].should eq(object)
      end
    end
  end
end
