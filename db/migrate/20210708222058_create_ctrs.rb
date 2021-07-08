class CreateCtrs < ActiveRecord::Migration[5.2]
  def change
    create_table :ctrs do |t|
      t.integer :user_id
      t.string :scenes
      t.timestamp :inserted_at
      t.timestamps
    end
  end
end
