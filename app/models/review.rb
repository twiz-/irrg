class Review < ActiveRecord::Base
  
  after_initialize :set_defaults
  
  belongs_to :location
  
  validates :product_image,:email, :first_name,:location_id,:comment,:reviewer_image, presence: true
  validates :comment, length: { in: 6..200}
  
  mount_uploader :product_image, ImageUploader
  mount_uploader :reviewer_image, ImageUploader
  
  scope :visible, -> { where(visibility: true) }
  scope :invisible, -> { where(visibility: false) }
  
  def set_defaults
    self.visibility = false if self.visibility.nil?  
  end
  
end
