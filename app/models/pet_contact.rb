class PetContact < ActiveRecord::Base
  attr_accessible :email, :mobile, :name, :phone

  validates :name, :presence => true
  validates :email, :presence => true

  belongs_to :pet
end
