class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :locations       
  has_many :reviews, through: :locations       
  
  def active_for_authentication?
    super && approved?
  end
  
  def inactive_message
    if !approved?
      :not_approved
    else
      super
    end
  end
  
  def self.send_reset_password_instructions(attributes={})
      recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
      if !recoverable.approved?
        recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
      elsif recoverable.persisted?
        recoverable.send_reset_password_instructions
      end
      recoverable
    end
  
end
