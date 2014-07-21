class User < ActiveRecord::Base
	
  has_secure_password



  before_save{ |user| user.email = user.email.downcase }
  before_save :create_remember_token 
  before_validation do |user|
  	user.name = "random" if user.name.blank?
  end
  
  validates :name,  presence: true, length: { maximum: 40}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true
  def self.name_longer_than_eight
  	User.where("length(name)>8")
  end

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
    
  end

end
