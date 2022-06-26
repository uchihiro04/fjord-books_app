class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
