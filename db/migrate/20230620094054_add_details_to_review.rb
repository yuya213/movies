class AddDetailsToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :genre_id, :integer
  end
end
