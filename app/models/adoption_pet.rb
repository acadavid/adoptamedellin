class AdoptionPet < ActiveRecord::Base
  attr_accessible :like_kids, :neutered, :temperament, :vaccines, :status, :pet_attributes

  has_one :pet, :dependent => :destroy, :as => :owner

  validates :pet, :presence => true

  accepts_nested_attributes_for :pet

  delegate :name, :age, :animal, :size, :pictures, :pet_contact, :interested_contacts, :gender, :location, :breed, :story, :municipality, :slug, :to => :pet

  STATES = ["pending_approval","unadopted","adopted"]

  def first_picture_file
    pictures.first.file
  end

  scope :unadopted_pets, -> { where(status: "unadopted") }

  scope :previous_pet, -> (adoption_pet) { where('created_at < ?', adoption_pet.created_at) }

  scope :next_pet, -> (adoption_pet) { where('created_at > ?', adoption_pet.created_at) }

  scope :recently_created, -> { order("created_at DESC") }
end
