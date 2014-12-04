class AdoptionPet < ActiveRecord::Base
  
  STATES = ["pending_approval","not_adopted","adopted"]

  attr_accessible :like_kids, :neutered, :temperament, :vaccines, :status, :pet_attributes

  has_one :pet, :dependent => :destroy, :as => :owner

  validates :pet, :presence => true

  accepts_nested_attributes_for :pet

  delegate :name, :age, :animal, :size, :pictures, :pet_contact, :interested_contacts, :gender, :location, :breed, :story, :municipality, :to => :pet

  scope :not_adopted_pets, -> { where(status: "not_adopted") }

  scope :previous_pet, -> (adoption_pet) { where('created_at < ?', adoption_pet.created_at) }

  scope :next_pet, -> (adoption_pet) { where('created_at > ?', adoption_pet.created_at) }

  scope :recently_created, -> { order("created_at DESC") }

  STATES.each do |status|
    define_method "#{status}?" do
      self.status.eql? status
    end
  end

  def first_picture_file
    pictures.first.file
  end
end
