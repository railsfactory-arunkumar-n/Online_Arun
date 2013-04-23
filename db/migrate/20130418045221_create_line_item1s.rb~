class CreateLineItem1s < ActiveRecord::Migration
  def change
    create_table :line_item1s do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity,:default => 1

      t.timestamps
    end
  end
end
