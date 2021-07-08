class CreateQuizScores < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_scores do |t|
      t.integer :user_id
      t.integer :score
      t.integer :use_time
      t.string :fail
      t.timestamps
    end
  end
end
