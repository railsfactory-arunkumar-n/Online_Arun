class AddOrderIdToLineItem1 < ActiveRecord::Migration
  def change
    add_column :line_item1s, :order_id, :integer
  end
end
