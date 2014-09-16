class User < ActiveRecord::Base
  attr_accessor :password

  validates :password, presence: true, confirmation: true
  validates :email, presence: true, uniqueness: true

  before_save :encrypt_password

  private

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
