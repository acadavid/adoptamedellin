class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  def extension_white_list
     %w(jpg jpeg gif png)
  end
end
