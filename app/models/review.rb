class Review < ActiveRecord::Base
  
  mount_uploader :product_image, ImageUploader
  mount_uploader :reviewer_image, ImageUploader
end
