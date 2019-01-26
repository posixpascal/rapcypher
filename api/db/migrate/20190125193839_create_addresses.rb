class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :streetnumber
      t.string :postalcode
      t.string :city
      t.string :country
      t.integer :user_id

      t.timestamps
    end
  end
end
