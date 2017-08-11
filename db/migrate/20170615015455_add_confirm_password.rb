class AddConfirmPassword < ActiveRecord::Migration[5.0]
  def change
    change_table :consumers do | t |
      t.string :password_confirmation
    end
  end
end
