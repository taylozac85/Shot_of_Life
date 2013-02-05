# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string(255)
#  user_email      :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :user_email, :user_name, :password, :password_confirmation
  has_secure_password
  # :dependent => :destroy ensures that if a user is destroyed by an admin, the associated reviews are destroyed
  has_many :reviews, :dependent => :destroy

  # used to ensure email uniqueness because not all database adapters
  # use case-sensitive indices
  before_save { |user| user.user_email = user_email.downcase }
  before_save :create_remember_token

  validates :user_name, :presence => true, :length => { :maximum => 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_email, :presence => true, 
  						 :format => { with: VALID_EMAIL_REGEX }, 
  						 :uniqueness => { :case_sensitive => false }
  validates :password, :length => { :minimum => 6 }
  validates :password_confirmation, :presence => true

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Review.where("user_id = ?", id)
  end
  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
