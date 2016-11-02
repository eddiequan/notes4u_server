require 'securerandom'

class User < ApplicationRecord
  before_create :set_auth_token
  validates :first_name, :last_name, :username, :presence => true
  validates_uniqueness_of :username

  has_many :requests, :class_name => "Request", :foreign_key => :req_id
  has_many :replies, through: :requests  
  has_many :tooks

  def first_user
    User.take(1)
  end

  private
  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
