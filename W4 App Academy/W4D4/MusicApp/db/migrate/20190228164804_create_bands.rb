class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.timestamps
      t.string :name, null:false 
    end
    add_index :bands, :name, unique: true 
  end
end
