FactoryGirl.define do
  factory :picture do
    file "lol_cat.jpg"
  end

  factory :picture_with_pet, :parent => :picture do
    pet
  end
end
