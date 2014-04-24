# encoding: utf-8

class ProfileImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  process convert: 'png'

  def filename
    super.chomp(File.extname(super)) + '.png' if original_filename.present?
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    path = 'fallback/' + [version_name, 'default.png'].compact.join('_')
    ActionController::Base.helpers.asset_path(path)
  end

  version :tiny do
    process resize_to_fit: [50, 50]
  end

  version :small do
    process resize_to_fit: [100, 100]
  end

  version :medium do
    process resize_to_fit: [200, 200]
  end

  version :large do
    process resize_to_fit: [300, 300]
  end

  # A white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
