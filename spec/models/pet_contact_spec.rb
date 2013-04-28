require 'spec_helper'

describe PetContact do
  it "is invalid without a name" do
    pet = FactoryGirl.build(:pet_contact, :name => "")
    pet.should_not be_valid
    pet.should have(1).error_on(:name)
  end

  it "is invalid without an email" do
    pet = FactoryGirl.build(:pet_contact, :email => "")
    pet.should_not be_valid
    pet.should have(1).error_on(:email)
  end
end
