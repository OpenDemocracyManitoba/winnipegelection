# encoding: utf-8

class ImageMapUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  process convert: 'png'

  def filename
    super.chomp(File.extname(super)) + '.png' if original_filename.present?
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small do
    process resize_to_fit: [90, 90]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
