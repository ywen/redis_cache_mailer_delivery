require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

module RedisCacheMailerDelivery
  describe CacheDelivery do
    describe "#deliver!" do
      subject {described_class.new :redis_key_name => "a-name", :marshallable_converters => []}
      let(:object) {Mail::Message.new}

      after(:each) do
        Redis.current.del "a-name"
      end
      it "puts a object into the redis store" do
        subject.deliver!(object)
        Redis::List.new("a-name", :marshal => true).values[0].should eq(object)
      end

      context "with marshallable_converters" do
        let(:class1) {double :class1, :marshallable => object1}
        let(:class2) {double :class1, :marshallable => object2}
        subject {described_class.new :redis_key_name => "a-name", :marshallable_converters => [class1, class2]}
        let(:object1) {double :object1}
        let(:object2) {Mail::Message.new}
        it "calls the converters and marshal the last object" do
          subject.deliver!(object)
          Redis::List.new("a-name", :marshal => true).values[0].should eq(object2)
        end
      end
    end
  end
end
