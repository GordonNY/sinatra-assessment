class Channel < ActiveRecord::Base
	has_many :posts
	has_many :channel_users
	has_many :users, through: :channel_users
	
	
end