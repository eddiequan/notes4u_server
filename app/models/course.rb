class Course < ApplicationRecord
  validates :course_code, :presence => true
end
