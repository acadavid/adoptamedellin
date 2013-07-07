class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  version :thumbnail do
    #process :resize_and_pad => [243, 243, "gray95"]
    process :resize_to_fill => [243, 243]
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end
end
