class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :introduction
      t.integer :customer_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
