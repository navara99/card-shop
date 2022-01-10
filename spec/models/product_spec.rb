require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category = Category.new name: "Food"
    end

    it "should be valid if the product has a name, price_cents, quantity, and category" do
      @product = Product.new name: "Apple", price_cents: 3, quantity: 100, category: @category
      expect(@product.valid?).to be_truthy
    end

    it "should not be valid if name is not present" do
      @product = Product.new  name: nil, price_cents: 3, quantity: 100, category: @category
      expect(@product.valid?).to be_falsy
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it "should not be valid if price_cents is not present" do
      @product = Product.new name: "Apple", price_cents: nil, quantity: 100, category: @category
      expect(@product.valid?).to be_falsy
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
    end

    it "should not be valid if quantity is not present" do
      @product = Product.new name: "Apple", price_cents: 3, quantity: nil, category: @category
      expect(@product.valid?).to be_falsy
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it "should not be valid if category is not present" do
      @product = Product.new name: "Apple", price_cents: 3, quantity: 100, category: nil
      expect(@product.valid?).to be_falsy
      expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
    end


  end
end
