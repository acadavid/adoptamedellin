class PetContact < ActiveRecord::Base
  attr_accessible :email, :mobile, :name, :phone

  validates :name, :presence => true
  validates :email, :presence => true, :email => true
  validates :phone, :phone => true
  validates :mobile, :phone => true, :if => lambda { |attrs| attrs[:mobile].present? }

  belongs_to :pet
end
