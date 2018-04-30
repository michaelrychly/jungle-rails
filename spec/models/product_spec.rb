require 'rails_helper'
require '././app/models/product'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create a product' do
      expect(Product.new).to be_a Product
    end

    it 'should not allow to create a product without a name' do
      product = Product.new
      product.name = nil
      product.price = 10
      product.quantity = 20
      product.category = Category.new(name: 'Furniture')
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'should not allow to create a product without a price' do
      product = Product.new
      product.name = 'test@example.com'
      product.price = nil
      product.quantity = 20
      product.category = Category.new(name: 'Furniture')
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it 'should not allow to create a product without a quantity' do
      product = Product.new
      product.name = 'test@example.com'
      product.price = 10
      product.quantity = nil
      product.category = Category.new(name: 'Furniture')
      product.valid?
      expect(product.errors[:quantity]).to include("can't be blank")
    end

    it 'should not allow to create a product without a category' do
      product = Product.new
      product.name = 'test@example.com'
      product.price = 10
      product.quantity = 20
      product.category = nil
      product.valid?
      expect(product.errors[:category]).to include("can't be blank")
    end

  end
end