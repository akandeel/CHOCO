class Users < ActiveRecord::Migration[5.0]
  def change
    create_table :users do | t |
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :date_of_birth
      t.string :country
      t.string :street_number
      t.string :street_name
      t.string :state
      t.string :suit_number
      t.string :mailing_address
      t.string :email_address
      t.string :password
      t.string :password_confirmation
      t.string :remember_digest
      t.string :password_digest
      t.string :role

        t.timestamps
      end



  end
end
