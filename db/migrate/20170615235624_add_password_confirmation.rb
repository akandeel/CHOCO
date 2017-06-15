class AddPasswordConfirmation < ActiveRecord::Migration[5.0]
  def change
    change_table :businesses do | t |
      t.string :password_confirmation
    end
  end
end
