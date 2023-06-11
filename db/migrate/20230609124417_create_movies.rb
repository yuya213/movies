class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :introduction
      t.integer :genre_id

      t.timestamps
    end
  end
end
