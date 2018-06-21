require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!({
        name:  'Michaels Test',
        description: Faker::Hipster.paragraph(4),
        image: open_asset('furniture2.jpg'),
        quantity: 3,
        price: 987.65
      })
      @product2 = Product.create!({
        name:  'Michaels Test2',
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel5.jpg'),
        quantity: 5,
        price: 123.45
      })
      # Setup at least one product that will NOT be in the order
      @product3 = Product.create!({
        name:  'Michaels Test3',
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel2.jpg'),
        quantity: 4,
        price: 321.45
      })
    end
    # pending test 1
    xit 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'test@example.com',
        total_cents: product1.price + product2.price,
        stripe_charge_id: 123 # created by stripe stripe_charge.id
      )

      puts "let's see" + product1.price
      # 2. build line items on @order
      order.line_items.new(
        product: product1,
        quantity: 1,
        item_price: product1.price,
        total_price: product1.price * quantity
      )
      order.line_items.new(
        product: product2,
        quantity: 1,
        item_price: product2.price,
        total_price: product2.price * quantity
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1[:quantity]).to eq(@product1[:quantity] - 1)
      expect(@product2[:quantity]).to eq(@product1[:quantity] - 1)
    end
    # pending test 2
    xit 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
      expect(@product3[:quantity]).to eq(4)
    end
  end
end
