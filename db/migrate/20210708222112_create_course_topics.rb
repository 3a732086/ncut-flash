class CreateCourseTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :course_topics do |t|
      t.integer :course_id
      t.integer :number
      t.string :eng_topic
      t.string :chi_topic
      t.timestamps
    end
  end
end
