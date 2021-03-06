FactoryGirl.define do
  factory :adoption_pet do
    vaccines true
    neutered false
    temperament "Loves to cuddle and kiss"
    like_kids true
  end

  factory :adoption_pet_with_pet, :parent => :adoption_pet do
    after(:create) { |ap| FactoryGirl.create(:pet, :owner => ap) }
  end
end
