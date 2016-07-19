require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views/'
    enable :sessions
    set :session_secret, "!@$%^&QWERasdf"
    use Rack::Flash
  end

  before do 
    session[:user_id] ? @logged_in = true : @logged_in = false
  end

  ['/'].each do |path|
    before path do

      if session[:user_id].nil? || User.find_by(id:session[:user_id]).nil?
        flash[:message] = "Please log in first."
        session[:user_id] = nil
        redirect '/login' 
      end
    end
  end

  get '/' do 
    unless session[:user_id].nil?
      @home_active = true
    end
    @user_id = session[:user_id]
    erb :index
  end
  after '/' do
    @home_active = false
  end


private


#   def post_params
#        params.require(:post).permit(:image, :other, :params)
#   end
end




