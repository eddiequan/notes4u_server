class Course < ApplicationRecord
  validates :course_id, :course_code, :semester, :presence => true
  validates_uniqueness_of :course_id
  validates :course_code, uniqueness: {scope: [:semster, :professor]}

  has_many :requests

  belongs_to :tooks
end
