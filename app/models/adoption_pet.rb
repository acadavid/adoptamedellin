class AdoptionPet < ActiveRecord::Base
  attr_accessible :like_kids, :neutered, :temperament, :vaccines, :pet_attributes

  has_one :pet, :dependent => :destroy, :as => :owner

  accepts_nested_attributes_for :pet

  delegate :name, :age, :animal, :size, :to => :pet
end
