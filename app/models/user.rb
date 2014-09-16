class User < ActiveRecord::Base
  attr_accessor :password

  validates :password, presence: true, confirmation: true
  validates :email, presence: true, uniqueness: true
end
