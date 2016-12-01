class Reply < ApplicationRecord
  validate :is_not_already_accepted, on: :create

  def is_not_already_accepted
    if Request.where(id: request_id).first.status == 2 then
      errors.add(:request, "has already been accepted.")
    end
  end
end
