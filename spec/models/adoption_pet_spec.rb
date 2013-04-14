require 'spec_helper'

describe AdoptionPet do
  it "can have a pet association" do
    ap = FactoryGirl.build(:adoption_pet)
    ap.should respond_to(:pet)
  end

  it "must have a pet associated" do
    ap = FactoryGirl.build(:adoption_pet)
    ap.pet.should be_nil
    ap.should_not be_valid
  end
end
