class Reply < ApplicationRecord
  validates :req_id, :notetaker, :presence => true
  validates :accepted, uniqueness: {scope: :notetaker}

  belongs_to :req_id
  belongs_to :notetaker, :class_name => "User", :foreign_key => :username

end
