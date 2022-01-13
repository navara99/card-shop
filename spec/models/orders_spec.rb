require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'After creation' do

    before :each do
      @category = Category.create!(name: "Clothing")
      
      @product1 = Product.create!(
        name:  'Men\'s Classy shirt',
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 25,
        category: @category
      )
      @product2 = Product.create!(
        name:  'Womens Pans',
        description: Faker::Hipster.paragraph(3),
        quantity: 4,
        price: 100,
        category: @category
      )
      
    end

    it 'deducts quantity from products based on their line item quantities' do
      
      @order = Order.new(
        email: "thar@mail.com",
        total_cents: 5000,
        stripe_charge_id: "1234567"
      )
      
      @line_item = @order.line_items.new(order: @order, product: @product1, quantity: 2, item_price_cents: 2500, total_price_cents: 5000)

      @order.save!
      
      @product1.reload
      @product2.reload

      expect(@product1.quantity).to eq(8)
    end

    it 'does not deduct quantity from products that are not in the order' do
      expect(@product2.quantity).to eq(4)
    end

  end
end
