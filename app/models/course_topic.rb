class CourseTopic < ApplicationRecord

  validates_numericality_of :course_id, greater_than_or_equal_to: 1
  validates_numericality_of :number, greater_than_or_equal_to: 0
  validates :eng_topic, :chi_topic, presence: true
end
