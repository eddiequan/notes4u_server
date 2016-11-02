class Took < ApplicationRecord
  validates :course_id, uniqueness: {scope: :username}
  validates :course_id, uniqueness: {scope: [:username, :grade]}

  has_many :courses
  belongs_to :username
end
