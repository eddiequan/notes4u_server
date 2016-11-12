class Reply < ApplicationRecord
  validates :request_id, :user_id, :status, :presence => true

  belongs_to :request
  belongs_to :user

end
