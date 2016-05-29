class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

=begin
  version :large do
    process resize_to_limit: [800, 800]
  end

  version :medium, from_version: :large do
    process resize_to_limit: [500, 500]
  end

  version :thumb, from_version: :medium do
    process resize_to_limit: [50, 50]
  end
=end

end