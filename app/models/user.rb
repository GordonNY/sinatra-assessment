class User < ActiveRecord::Base
	has_many :posts
	has_many :channel_users
	has_many :channels, through: :channel_users
	

	has_secure_password
	
	# after_initialize :init

	# def init
	# 	# self.thumbnail = '../../public/img/default_thumbnail.png'
	# end

	def to_s
		self.first_name.capitalize + " " + self.last_name.capitalize
	end
end