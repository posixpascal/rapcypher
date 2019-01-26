class AddRapperFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rapper_name, :string
    add_column :users, :bio, :text
    add_column :users, :dob, :datetime
    add_column :users, :favorite_punchline, :text
    add_column :users, :address_id, :integer
  end
end
