FactoryGirl.define do
  factory :pet do
    animal "dog"
    name "Tupac"
    age "1 year"
    gender "male"
    size "big"
    breed "boxer"
    color "brown"
    location "Medellin"
    marks "Short tail"
    notes "He loves to pee on people"
    story "He has move a couple of times from families because he barks to visitors"
  end

  factory :pet_with_pictures, :parent => :pet do
    after(:create) do |pet|
      pet.pictures << FactoryGirl.create(:picture, :pet => pet)
    end
  end
end
