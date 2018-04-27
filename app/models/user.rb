class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_secure_password
  validates_confirmation_of :password
end
