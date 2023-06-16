class AddReviewToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :review, :text
  end
end
