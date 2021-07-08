class Ctr < ApplicationRecord

  validates_numericality_of :user_id, greater_than_or_equal_to: 1

end
