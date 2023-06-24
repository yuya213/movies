class RemoveReviewFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :text, :string
  end
end
