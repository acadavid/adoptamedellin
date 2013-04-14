require 'spec_helper'

describe Picture do

  it "can have a pet" do
    pic = FactoryGirl.build(:picture)
    pic.should respond_to(:pet)
  end

  it "is invalid without a file" do
    pic = FactoryGirl.build(:picture, :file => "")
    pic.should_not be_valid
    pic.should have(1).errors_on(:file)
  end
end
