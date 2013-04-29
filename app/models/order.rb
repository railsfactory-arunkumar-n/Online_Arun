class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type
  PAYMENT_TYPES = [ "Check" , "Credit card" , "Purchase order" ]
  #PAYMENT_TYPES = [ "Check" , "Credit card" , "Purchase order" ]
  #validates :name, :address, :email, :pay_type, :presence => true
  #validates :pay_type, :inclusion => PAYMENT_TYPES
  has_many :line_item1s, :dependent => :destroy
  #after_create :email_article_author
  def add_line_items_from_cart(cart)
      cart.line_item1s.each do |item|
      item.cart_id = nil
      line_item1s << item
    end
  end

  def email_article_author()
    p 1111111111111111111111111111111
   # p order
    p 2222222222222222222222222222222
     Notifier.order.deliver
  end
  
end
