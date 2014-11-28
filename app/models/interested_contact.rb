class InterestedContact < ActiveRecord::Base
  attr_accessible :email, :name, :phone

  validates :name, :presence => true
  validates :email, :presence => true, :email => true
  validates :phone, :phone => true

  belongs_to :pet
end
