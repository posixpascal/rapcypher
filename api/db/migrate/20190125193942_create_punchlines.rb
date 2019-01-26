class CreatePunchlines < ActiveRecord::Migration[5.2]
  def change
    create_table :punchlines do |t|
      t.integer :user_id
      t.text :punchline

      t.timestamps
    end
  end
end
