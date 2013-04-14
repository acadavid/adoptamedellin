require 'spec_helper'

describe Pet do

  it "is invalid without a animal type" do
    pet = FactoryGirl.build(:pet, :animal => "")
    pet.should_not be_valid
    pet.should have(1).error_on(:animal)
  end

  it "is invalid without a name" do
    pet = FactoryGirl.build(:pet, :name => "")
    pet.should_not be_valid
    pet.should have(1).error_on(:name)
  end
end
