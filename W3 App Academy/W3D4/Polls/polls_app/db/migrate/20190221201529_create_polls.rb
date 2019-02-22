class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.integer :user_id, presence: true
      t.string :title, presence: true, unique: true 
     
      t.timestamps
    end
    add_index(:polls, [:user_id, :title], unique: true)
  end
end
