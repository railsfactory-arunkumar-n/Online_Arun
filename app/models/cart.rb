class Cart < ActiveRecord::Base
   attr_accessible :name, :body
  has_many :line_item1s, :dependent => :destroy
  def add_product(product_id)
    current_item = line_item1s.where(:product_id => product_id).first
      if current_item
        p 666666666666666666666666
        p current_item
        current_item.quantity += 1
      else
        current_item = LineItem1.new(:product_id=>product_id)
        line_item1s << current_item
      end
    current_item
  end
   def total_price
    line_item1s.to_a.sum { |item| item.total_price }
  end
end
