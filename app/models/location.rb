class Location < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  
  def to_param
    "#{id}-#{name}".parameterize
  end
end
