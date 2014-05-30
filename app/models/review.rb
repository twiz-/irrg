class Review < ActiveRecord::Base
  
  after_initialize :set_defaults
  
  belongs_to :location
  
  mount_uploader :product_image, ImageUploader
  mount_uploader :reviewer_image, ImageUploader
  
  scope :visible, -> { where(visibility: true) }
  scope :invisible, -> { where(visibility: false) }
  
  def set_defaults
    self.visibility = false if self.visibility.nil?  
  end
  
end
