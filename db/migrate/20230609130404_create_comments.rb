class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :introduction
      t.integer :customer_id
      t.integer :review_id

      t.timestamps
    end
  end
end
