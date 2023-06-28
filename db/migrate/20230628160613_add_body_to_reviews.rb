class AddBodyToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :body, :text
  end
end
