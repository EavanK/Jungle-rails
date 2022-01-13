class UserMailer < ApplicationMailer

  def order_confirmation (user, order)
    @user = user
    @order = order
    @url = "http://localhost:3000/orders/#{@order.id}"
    mail( to: @user.email, subject: "Order ##{@order.id}. Order has been received.")
  end
end
