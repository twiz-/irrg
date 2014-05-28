class Review < ActiveRecord::Base
  belongs_to :location
  
  mount_uploader :product_image, ImageUploader
  mount_uploader :reviewer_image, ImageUploader
end
