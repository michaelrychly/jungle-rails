class Product < ActiveRecord::Base
  has_many :review, dependent: :destroy
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def sold_out?
    if quantity == 0
      true
    end
  end

end
