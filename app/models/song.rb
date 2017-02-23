class Song < ActiveRecord::Base
	has_many :playlists, dependent: :destroy
	has_many :users, through: :playlists
	length_regex = /\A[a-zA-Z\s]{2,}\z/i
	validates :title, :artist, presence: true, :format => {:with => length_regex}
	
end
