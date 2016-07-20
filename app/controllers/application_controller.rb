require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views/'
    enable :sessions
    set :session_secret, "!@$%^&QWERasdf"
    use Rack::Flash

    set :server, :thin
    register Sinatra::Reloader
    Pusher.app_id = '227714'
    Pusher.key = '34b83dc670b5cd1b896e'
    Pusher.secret = '4f29dfce4294d2d5c8b2'

  end



  before do 
    session[:user_id] ? @logged_in = true : @logged_in = false
    session[:messages] = []
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

    @current_channel_hide = true




    erb :index
  end
  after '/' do
    @home_active = false
  end

  get '/channel/:id' do
    @current_channel_hide = false
    @current_channel = Channel.find(params[:id])
    @current_user = User.find(session[:user_id])
    
    # register a client's interest in server events
    erb :index
  end



  post '/channel' do
    user = User.find(session[:user_id])
    Pusher['test_channel'].trigger('new_message', :message => params['message'], :user => user.to_s)
  end


private


#   def post_params
#        params.require(:post).permit(:image, :other, :params)
#   end
end




