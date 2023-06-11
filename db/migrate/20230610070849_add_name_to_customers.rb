class AddNameToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :name, :string, null: false, default: ""
    add_column :customers, :is_deleted, :boolean, default: false, null: false
  end
end
