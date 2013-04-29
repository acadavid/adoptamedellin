require 'spec_helper'

describe InterestedContact do
  it "is invalid without a name" do
    contact = FactoryGirl.build(:interested_contact, :name => "")
    contact.should_not be_valid
    contact.should have(1).error_on(:name)
  end

  it "is invalid without an email" do
    contact = FactoryGirl.build(:interested_contact, :email => "")
    contact.should_not be_valid
    contact.should have(1).error_on(:email)
  end

  it "can have a pet" do
    contact = FactoryGirl.build(:interested_contact)
    contact.should respond_to(:pet)
  end
end
