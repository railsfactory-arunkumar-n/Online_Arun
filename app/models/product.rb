class Product < ActiveRecord::Base
   attr_accessible :name, :price
  validates :name, :price,  :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  default_scope :order => 'name'
   has_many :line_item1s
   before_destroy :ensure_not_referenced_by_any_line_item
    #default_scope :order => 'title'
     # has_many :line_items
    #  before_destroy :ensure_not_referenced_by_any_line_item
      def ensure_not_referenced_by_any_line_item
         if line_item1s.count.zero?
            return true
            else
            errors[:base] << "Line Items present"
            return false
         end
      end
   end
