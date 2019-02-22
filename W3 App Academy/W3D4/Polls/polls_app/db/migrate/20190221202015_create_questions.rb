class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :poll_id, NULL: false
      t.text :text, NULL: false
      
      t.timestamps
    end
    add_index(:questions, [:poll_id, :text], unique: true)
  end
end
