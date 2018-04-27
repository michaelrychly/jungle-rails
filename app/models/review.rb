class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :description, presence: true
  validates :rating, presence: true, :inclusion => { :in => 1..5 }
  validates_presence_of :user
  validates_presence_of :product
end
