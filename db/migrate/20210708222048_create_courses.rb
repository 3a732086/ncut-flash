class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.timestamp :inserted_at
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
