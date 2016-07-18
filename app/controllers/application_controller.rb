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

  get '/' do 
  	erb :index
  end

# private

#   def post_params
#        params.require(:post).permit(:image, :other, :params)
#   end
end




