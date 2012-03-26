require 'spec_helper'

describe RedisCacheMailerDelivery::Converters::SequelMarshallableMailMessage do
  let(:object) {Class.new.new}
  describe "#marshallable" do
    context "when the message responds to the record message" do
      let(:record) {double :sequel_record, :marshallable! => nil}
      before(:each) do
        object.stub(:record).and_return record
      end

      it "calls the record's marshallable! method" do
        record.should_receive(:marshallable!).and_return record
        described_class.marshallable object
      end

      it "returns the mail" do
        described_class.marshallable(object).should eq(object)
      end

      context "and the record is nil" do
        before(:each) do
          object.stub(:record).and_return nil
        end

        it "returns itself" do
          described_class.marshallable(object).should eq(object)
        end
      end
    end

    context "when the message does not respond to the record message" do
      it "returns itself" do
        described_class.marshallable(object).should eq(object)
      end
    end
  end
end
