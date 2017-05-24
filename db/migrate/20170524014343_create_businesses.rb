class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do | t |

      t.string :business_name
      t.string :directors_name
      t.string :country
      t.string :street_number
      t.string :street_name
      t.string :province
      t.string :unit_number
      t.string :mailing_address
      t.string :email_address
      t.string :password


      t.timestamps
    end
  end
end
