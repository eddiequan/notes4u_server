class Request < ApplicationRecord
  validates :req_id, :slacker, :course_id, :when, :presence => true
  validates_uniqueness_of :req_id
  validates :when, uniqueness: {scope: :notetaker}, if: 'notetaker.present?'

  belongs_to :slacker, :class_name => "User", :foreign_key => :username
  belongs_to :notetaker, :class_name => "User", :foreign_key => :username
  belongs_to :courses

  has_one :reply
  has_one :rating
end
