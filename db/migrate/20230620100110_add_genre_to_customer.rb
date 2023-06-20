class AddGenreToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :genre_id, :integer
  end
end
