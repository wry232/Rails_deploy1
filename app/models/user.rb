class User < ActiveRecord::Base
  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :playlists, dependent: :destroy
  has_many :songs, through: :playlists
  before_validation do
	  self.email = email.downcase if email.present?
  end
  validates :email, :password, :first_name, :last_name, presence: true
  validates :email, :format => {:with => email_regex}
end
