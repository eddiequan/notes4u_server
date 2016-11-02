class Rating < ApplicationRecord
  validates :req_id, uniqueness: {scope: :rating}
  
  belongs_to :requests
end
