class Pet < ActiveRecord::Base
  attr_accessible :age, :animal, :breed, :color, :gender, :location, :municipality, :marks, :name, :notes, :size, :story, :pictures_attributes, :pet_contact_attributes

  validates :animal, :presence => true
  validates :gender, :presence => true
  validates :name, :presence => true
  validates :location, :presence => true
  validates :municipality, :presence => true
  validates :pet_contact, :presence => true
  validate :kinf_of_animal
  validate :gender_of_animal
  validate :at_least_one_picture

  belongs_to :owner, :polymorphic => :true
  has_many :pictures, :dependent => :destroy
  has_one :pet_contact, :dependent => :destroy
  has_many :interested_contacts, :dependent => :destroy

  accepts_nested_attributes_for :pictures, :pet_contact

  def kinf_of_animal
    unless self.animal.nil?
      errors.add(:animal, "es inválido") unless ["Perro", "Gato"].include?(self.animal)
    end
  end

  def gender_of_animal
    unless self.gender.nil?
      errors.add(:gender, "es inválido") unless ["Macho", "Hembra"].include?(self.gender)
    end
  end

  def at_least_one_picture
    errors.add(:pictures, "debe tener al menos una") if self.pictures.size < 1
  end
end
