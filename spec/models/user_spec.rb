require 'spec_helper'
require 'rails_helper'

RSpec.describe User, :type => :model do
    it "does not allow duplicate username" do
      user1 = User.create!(first_name: "first", last_name: "last", username: "username")
      user2 = User.new(first_name: "test", last_name: "test", username: user1.username)

      expect(user2.valid?).to be_falsey
    end
end
