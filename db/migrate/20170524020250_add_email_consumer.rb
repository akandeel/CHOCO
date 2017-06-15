class AddEmailConsumer < ActiveRecord::Migration[5.0]
  def change
    change_table :consumers do | t |
      t.string :email
    end
  end
end
