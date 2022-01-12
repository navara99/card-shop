class OrderMailer < ApplicationMailer

  def order_email(order)
    @order = order
    @line_items = @order.line_items.all
    mail to: @order.email , subject: "Your Jungle order ##{@order.id}."
  end

end
