class User < ActiveRecord::Base

	has_secure_password
	
	after_initialize :init

	def init
		self.thumbnail = '../../public/img/default_thumbnail.png'
	end
end