class Pet < ActiveRecord::Base
  attr_accessible :age, :animal, :breed, :color, :gender, :location, :marks, :name, :notes, :size, :story, :pictures_attributes, :pet_contact_attributes

  validates :animal, :presence => true
  validates :name, :presence => true
  validates :location, :presence => true
  validate :at_least_one_picture
  validates :pet_contact, :presence => true

  belongs_to :owner, :polymorphic => :true
  has_many :pictures, :dependent => :destroy
  has_one :pet_contact, :dependent => :destroy
  has_many :interested_contacts, :dependent => :destroy

  accepts_nested_attributes_for :pictures, :pet_contact

  def self.valid_animals
    ["perro", "gato"]
  end

  def at_least_one_picture
    errors.add(:pictures, "debe tener al menos una") if self.pictures.size < 1
  end
end
