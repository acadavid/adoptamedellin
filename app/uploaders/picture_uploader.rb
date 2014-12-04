class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage Rails.application.config.carrier_wave_storage

  version :thumbnail do
    process :resize_to_fill => [131, 131]
  end

  version :email do
    process :resize_to_fill => [243, 243]
  end

  version :show do
    process :resize_to_fill => [440, 440]
  end

  version :index do
    process :resize_to_fill => [254, 254]
  end

  version :adopted do
    process :resize_to_fill => [254, 254]
    process :watermark
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end

  protected
  def watermark
    manipulate! do |img|
      logo = Magick::Image.read("#{Rails.root}/app/assets/images/adopted_watermark.png").first

      white_canvas = Magick::Image.new(logo.columns, logo.rows) { self.background_color = "none" }
      white_canvas.opacity = Magick::QuantumRange - (Magick::QuantumRange * 0.4)

      logo = logo.composite(white_canvas, Magick::NorthWestGravity, 0, 0, Magick::DstInCompositeOp)

      img = img.composite(logo, Magick::NorthWestGravity, 15, 0, Magick::OverCompositeOp)
    end
  end
end