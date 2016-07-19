require './config/environment'
require 'rack-flash'

class UsersController < Sinatra::Base
	configure do 
		set :views, 'app/views/'
		enable :sessions
		set :session_secret, "!@$%^&QWERasdf"
		use Rack::Flash
	end

	get '/login' do 
		erb :'users/login'
	end

	post '/login' do 
		user_params = params[:user]

		if user_params[:username].nil? ||
			user_params[:password].nil?

			flash[:message] = "Please fill in all fields."
			redirect '/login'
		else
			user = User.find_by(username: params[:user][:username])
			if user && user.authenticate(params[:user][:password])
				session[:user_id] = user.id
				redirect '/'
			else
				flash[:message] = "No such user. Please sign up a new user."
				redirect '/signup'
			end
		end
	end

	get '/signup' do 
		erb :'users/signup'
	end
end