require 'spec_helper'
require 'rails_helper'

RSpec.describe User, :type => :model do
    it "does not allow duplicate username" do
      user1 = User.create!(username: "username")

      assert_raises(Exception) {User.create!(username: user1.username)}
    end
end
