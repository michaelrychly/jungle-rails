class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_secure_password

  validates_confirmation_of :password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
end
