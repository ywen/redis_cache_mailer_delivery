require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

module RedisCacheMailerDelivery
  describe MarshallableConverterSetting do
    describe ".builtin_settings" do
      it "returns the hash of builtin marshallable converters" do
        described_class.builtin_settings.should eq({:sequel_record_marshallable => Mail::SequelMarshallableMailMessage})
      end
    end
    describe "#marshallable_class" do
      before(:each) do
        described_class.stub(:builtin_settings) {{:name => Object}}
      end
      context "when the converter name is one of builtins" do
        subject {described_class.new :name}
        it "returns the corresponding class" do
          subject.marshallable_class.should eq(Object)
        end
      end
      context "when the converter name is not one of builtins" do
        subject {described_class.new Module}
        it "returns the name" do
          subject.marshallable_class.should eq(Module)
        end
      end
    end
  end
end

