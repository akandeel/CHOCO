class AddRemeberDigestToConsumers < ActiveRecord::Migration[5.0]
  def change
    change_table :consumers do | t |
      t.string :remember_digest
    end
  end
end
