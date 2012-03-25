require 'spec_helper'

describe Mail::MarshallableMailMessage do
  subject {Class.new{include Mail::MarshallableMailMessage}.new}
  describe "#marshallable" do
    context "when the message responds to the record message" do
      let(:record) {double :sequel_record, :marshallable! => nil}
      before(:each) do
        subject.stub(:record).and_return record
      end

      it "calls the record's marshallable! method" do
        record.should_receive(:marshallable!).and_return record
        subject.marshallable
      end

      it "returns the mail" do
        subject.marshallable.should eq(subject)
      end

      context "and the record is nil" do
        before(:each) do
          subject.stub(:record).and_return nil
        end

        it "returns itself" do
          subject.marshallable.should eq(subject)
        end
      end
    end

    context "when the message does not respond to the record message" do
      it "returns itself" do
        subject.marshallable.should eq(subject)
      end
    end
  end

  it "mixes itself into Mail::Message" do
    Mail::Message.ancestors.should include(Mail::MarshallableMailMessage)
  end
end
