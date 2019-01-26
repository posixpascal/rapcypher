class CreateRecordings < ActiveRecord::Migration[5.2]
  def change
    create_table :recordings do |t|
      t.integer :user_id
      t.string :title
      t.integer :duration

      t.timestamps
    end
  end
end
