class AddStatusToCourse < ActiveRecord::Migration[5.2]
  def change
      add_column :courses, :status, :integer, default: 1, null: false
  end
end
