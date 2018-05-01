class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_secure_password

  validates_confirmation_of :password
  validates_length_of :password, minimum: 7, on: :create
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email

  def self.authenticate_with_credentials(email, password)
    puts "in the method #{email}"
    user = User.find_by_email(email)
    puts " after find #{user.inspect}"
    #if user && user.authenticate(password)
      user
    #end
  end
end
