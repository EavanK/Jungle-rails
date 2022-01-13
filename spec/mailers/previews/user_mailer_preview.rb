# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def order_confirmation
    user = User.find_by_email('eavan@gmail.com')
    order = Order.find_by_id(30)
    UserMailer.order_confirmation(user, order)
  end
end
