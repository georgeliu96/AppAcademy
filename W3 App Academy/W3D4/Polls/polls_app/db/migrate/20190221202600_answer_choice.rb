class AnswerChoice < ActiveRecord::Migration[5.2]
  def change 
    create_table :answer_choices do |t|
      t.integer :question_id, NULL: false
      t.text :text, NULL: false
      
      t.timestamps
    end
    add_index(:answer_choices, [:question_id, :text], unique: true)
  end
end
