# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  def order_email
    @order = Order.new(
      email: "test_email@email.com",
      total_cents: 30026,
    )
    OrderMailer.order_email(@order)
  end

end
