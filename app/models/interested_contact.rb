class InterestedContact < ActiveRecord::Base
  attr_accessible :email, :name, :phone

  validates :name, :presence => true
  validates :email, :presence => true

  belongs_to :pet
end
