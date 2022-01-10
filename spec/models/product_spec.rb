require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should be valid if the product has a name, price, quantity, and category" do
      @category = Category.new name: "Food"
      @product = Product.new name: "Apple", price: 3, quantity: 100, category: @category
      expect(@product.valid?).to be_truthy
    end

    it "should not be valid if name is not present" do
      @category = Category.new name: "Food"
      @product = Product.new  price: 3, quantity: 100, category: @category
      expect(@product.valid?).to be_falsy
    end


  end
end
