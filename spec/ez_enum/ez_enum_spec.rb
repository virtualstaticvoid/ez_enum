require './spec/spec_helper'

describe "ez_enum" do

  before do
    I18n.locale = :en
  end

  AllStatuses = [Status::New, Status::Processing, Status::Failed, Status::Complete]

  describe "::All" do
    it { defined?(Status::All).should_not be nil }
    it { Status::All.should eq(AllStatuses) }
  end

  describe ".choices_for_select" do
    it { Status.respond_to?(:choices_for_select).should be true }
    it { Status.choices_for_select.should_not be nil }
    it { Status.choices_for_select.length.should eq(AllStatuses.length) }
    it { Status.choices_for_select.first.should eq(['New', 1])}
    it "has correct display for switch in locale" do
      I18n.locale = :af
      Status.choices_for_select.first.should eq(['Nuwe', 1])
    end
  end

  describe ".display_for" do
    it { Status.respond_to?(:display_for).should be true }
    it "provides display_for each member" do
      Status::All.each do |status|
        Status.display_for(status).should_not be nil
      end
    end
    it { Status.display_for(Status::Failed).should eq('Epic Fail') }
    it "has correct display for switch in locale" do
      I18n.locale = :af
      Status.display_for(Status::Failed).should eq('Gebreek')
    end
  end

end