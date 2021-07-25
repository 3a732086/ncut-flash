class Course < ApplicationRecord
  has_many :course_topics

  validates :name, presence: true
end
