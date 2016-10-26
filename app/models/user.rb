class User < ApplicationRecord
  def first_user
    User.take(1)
  end
end
