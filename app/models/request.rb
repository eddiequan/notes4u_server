class Request < ApplicationRecord
  validates :user_id, :course_id, :when, :presence => true

  belongs_to :users
  belongs_to :courses

  has_one :reply
  has_one :rating
end
