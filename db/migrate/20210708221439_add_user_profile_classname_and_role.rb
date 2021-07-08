class AddUserProfileClassnameAndRole < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :student_class, :string
    add_column :users, :role, :integer,  default: 0, null: false
  end
end
