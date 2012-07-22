class User < ActiveRecord::Base
  attr_accessible :name, :password
  has_secure_password
  has_many :posts

  before_save :create_remember_token

  validates :name, presence: true
  validates :password, presence: true

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end