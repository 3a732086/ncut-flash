class QuizScore < ApplicationRecord

  validates_numericality_of :user_id, greater_than_or_equal_to: 1
  validates_numericality_of :score, greater_than_or_equal_to: 0
  validates_numericality_of :use_time, greater_than: 1
end
