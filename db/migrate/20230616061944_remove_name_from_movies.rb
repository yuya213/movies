class RemoveNameFromMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :name, :string
    remove_column :movies, :introduction, :text
  end
end
