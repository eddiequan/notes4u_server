class Reply < ApplicationRecord
  validates :req_id, :user_id, :status, :presence => true

  belongs_to :requests
  belongs_to :users

end
