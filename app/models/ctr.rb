class Ctr < ApplicationRecord

  validates :user_id, :scenes, :inserted_at, presence: true
  validates_numericality_of :user_id, greater_than_or_equal_to: 1

end
