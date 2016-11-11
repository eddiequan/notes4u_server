require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "Getting users" do
    it "gets all users" do
      user = User.create!(first_name: "test", last_name: "test", email: "test", username: "test")
      get :index

      expect(response.body).to include("test")
    end

    it "creates a user" do
      post :create, params: {user: {first_name: "first name", last_name: "last name", username:"username"}}

      expect(User.count).to eq(1)
    end

    it "creates an authentication token when a user is created" do
      post :create, params: {user: {first_name: "first name", last_name: "last name", username:"username"}}
      
      expect(User.take(1).first.auth_token).to_not be_nil
    end

    it "has a first name and last name" do
      user = User.create!(first_name: "first name", last_name: "last name", username: "username")
      get :index

      expect(response.body).to include("first name")
    end
  end

  describe "Logging in" do
    it "returns an auth token when you log in" do
      user = User.create!(first_name: "first", last_name: "last", username: "username", password: "password")
      
      post "login", params: {user: {username: user.username, password: user.password}}
      
      expect(response.body).to include(user.auth_token)
    end
  end
end
