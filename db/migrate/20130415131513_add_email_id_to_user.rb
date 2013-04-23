class AddEmailIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :email_id, :string
    add_column :users, :string, :string
  end
end
