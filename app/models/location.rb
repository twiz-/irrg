class Location < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  
  validates :name, uniqueness: true, presence: true

  
  def to_param
    "#{id}-#{name}".parameterize
  end
end
