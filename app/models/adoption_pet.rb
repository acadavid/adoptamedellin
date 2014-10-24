class AdoptionPet < ActiveRecord::Base
  attr_accessible :like_kids, :neutered, :temperament, :vaccines, :pet_attributes

  has_one :pet, :dependent => :destroy, :as => :owner

  validates :pet, :presence => true

  accepts_nested_attributes_for :pet

  delegate :name, :age, :animal, :size, :pictures, :pet_contact, :interested_contacts, :gender, :location, :breed, :story, :municipality, :to => :pet

  def first_picture_file
    pictures.first.file
  end
end
