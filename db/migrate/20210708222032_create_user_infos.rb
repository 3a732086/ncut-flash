class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.belongs_to :user
      t.string :scenes
      t.string :topic
      t.string :input_data
      t.timestamp :inserted_at
      t.timestamps
    end
  end
end
