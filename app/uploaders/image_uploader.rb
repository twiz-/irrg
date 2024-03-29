# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog  
  # Process files as they are uploaded:
  process :set_content_type  
  process resize_to_fit: [1632, 1224]
  process :fix_exif_orientation
  
  def fix_exif_orientation
    manipulate! do |img|
      img.auto_orient!
      img = yield(img) if block_given?
      img
    end
  end
  
  

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "merchants/#{model.class.to_s.underscore}s/#{mounted_as}/#{model.location.id}"
  end


   
  #
  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{secure_token}.#{file.extension}" if original_filename
  end
  
  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(10))
  end

end
