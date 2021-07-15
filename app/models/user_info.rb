class UserInfo < ApplicationRecord
  belongs_to :user

  validates :user_id, :scenes, :topic, :input_data, presence: true

end
