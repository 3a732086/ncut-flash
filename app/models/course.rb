class Course < ApplicationRecord
  has_many :course_topics

  validates :name, presence: true

  enum status: [:is_hidden, :is_published]
end
