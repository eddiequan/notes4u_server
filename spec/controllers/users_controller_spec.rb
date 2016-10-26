require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "Getting users" do
    it "gets all users" do
      user = User.create!(email: "test")
      get :index

      expect(response.body).to include("test")
    end

    it "creates a user" do
      post :create, params: {user: {first_name: "first name", last_name: "last name"}}

      expect(User.count).to eq(1)
    end

    it "has a first name and last name" do
      user = User.create!(first_name: "first name", last_name: "last name")
      get :index

      expect(response.body).to include("first name")
    end
  end
end
