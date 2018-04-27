class UserMailer < ActionMailer::Base
 default :from => "no-reply@jungle.com"

 def order_confirmation(order)
    @order = order
    puts "#{order.email}"
    mail(:to => "#{order.email}", :subject => "Order Confirmation for order number #{order.id}")
 end
end
