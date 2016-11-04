class Request < ApplicationRecord
  validates :user_id, :course_id, :when, :presence => true

  has_one :user
  has_one :course

  has_one :reply
  has_one :rating
end
