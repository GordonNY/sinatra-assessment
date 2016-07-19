class ChannelsController < ApplicationController

	get '/channels/new' do
		erb :'channels/new'
	end

	post '/channels' do
		Channel.create(params[:channel])

		redirect '/'
	end

end