class RemoveFieldNameFromBusinesses < ActiveRecord::Migration[5.0]
  def change
    remove_column :businesses, :password, :string
  end
end
