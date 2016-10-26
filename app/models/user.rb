class User < ActiveRecord::Base
  has_secure_password
  has_many :posts 
  has_many :likes
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 8}
end
