require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

module RedisCacheMailerDelivery
  describe Settings do
    describe ".default_values" do
      {:redis_key_name => "redis_cache_mailer_delivery:mail_messages",
        :marshallable_converters => []}.each do |key, value|
        it "includes #{key} and its default value to #{value}" do
          described_class.default_values.should include(key => value)
        end
      end
    end

    describe ".new" do
      context "when a value that is a key in default_values hash being passed in" do
        subject {described_class.new :redis_key_name => "a-new-name"}
        it "generates a method and return the value being passed in" do
          subject.redis_key_name.should eq("a-new-name")
        end
      end
      context "when a value that is not a key in default_values hash being passed in" do
        subject {described_class.new :something_else => "a-new-name"}
        it "generates a method and return the value being passed in" do
          subject.something_else.should eq("a-new-name")
        end
      end
      Settings.default_values.each do |key, value|
        context "when #{key} is not passed in" do
          subject {described_class.new({})}
          it "generates a method #{key} and return the value defined in the default_values array" do
            subject.send(key).should eq(value)
          end
        end
      end
    end
  end
end
