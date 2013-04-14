class Picture < ActiveRecord::Base
  belongs_to :pet
  attr_accessible :file

  validates :file, :presence => true

  mount_uploader :file, PictureUploader
end
