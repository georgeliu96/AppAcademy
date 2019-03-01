class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false 
      t.string :title, null: false 
      t.integer :ord, null: false 
      t.text :body 
      t.boolean :bonus, default: false  
    end
    add_index :tracks, :album_id
    add_index :tracks, [:album_id, :ord], unique: true 
  end
end
