class Notifier < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.product_added.subject
  #
  def product_added
    @greeting = "Hi"

    mail :to => "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.product_deleted.subject
  #
  def product_deleted
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
  def order_received(product)
    @product = product
    name =@product.name
    #mail :to => "arun.n@railsfactory.org", :subject => 'Pragmatic Store product Confirmation'
    ActionMailer::Base.mail(:from => "arunkumarit02@gmial.com", :to => "arun.n@railsfactory.org", :subject => "Adding new product", :body => "the product #{name} is added into the list").deliver
  end
  def forgot_password(email_id,code)
    p 111111111111111111111111111111111111111111111111111111111111
    p code
    p @emal = email_id
    p email_id
    
    p 111111111111111111111111111111111111111111111111111111111111
     ActionMailer::Base.mail(:from => "arunkumarit02@gmial.com", :to => email_id, :subject => "token code", :body => "please enter the code in the reset password text. the code is #{code}").deliver
   end
   def order
     p 00000000000000000000000000000000000
       ActionMailer::Base.mail(:from => "arunkumarit02@gmial.com", :to => "arun.n@railsfactory.org", :subject => "Adding new product", :body => "the product {name} is added into the list")
       
    end
end
