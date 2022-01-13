class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

  after_create :update_remaining_quantities

  private

  def update_remaining_quantities

    # Update the quantity remaining in stock
    quantity = self.quantity
    @product = self.product
    @product.quantity -= quantity
    @product.save

  end

end
