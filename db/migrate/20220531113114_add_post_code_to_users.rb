class AddPostCodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :post_code, :string
    add_column :users, :address, :string
    add_column :users, :self_introduction, :string
    add_column :users, :user_name, :string, null: false
  end
end
