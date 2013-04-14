require 'spec_helper'

describe AdoptionPet do
  it "can have a pet association" do
    ap = FactoryGirl.build(:adoption_pet)
    ap.should respond_to(:pet)
  end

  it "should have a pet associated" do
    ap = FactoryGirl.create(:adoption_pet)
    ap.pet.should_not be_nil
    ap.should be_valid
  end
end
