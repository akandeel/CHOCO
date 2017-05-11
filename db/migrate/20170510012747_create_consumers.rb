class CreateConsumers < ActiveRecord::Migration[5.0]
  def change
    create_table :consumers do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :date_of_birth
      t.string :country
      t.string :street_number
      t.string :street_name
      t.string :state
      t.string :suit
      t.string :mailing_address

      t.timestamps
    end
  end
end
