class User < ActiveRecord::Base
  attr_accessor :password
  has_many :posts

  validates :password, presence: true, confirmation: true
  validates :email, presence: true, uniqueness: true

  before_save :encrypt_password

  private

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
