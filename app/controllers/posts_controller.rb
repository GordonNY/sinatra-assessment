class PostsController < ApplicationController

	post '/posts' do
		params[:post][:user_id] = session[:user_id]
		
		Post.create(params[:post])

		redirect "/channel/#{params[:post][:channel_id]}"
	end

	get '/post/:id/edit' do 
		@post = Post.find(params[:id])

		erb :'posts/edit'
	end

	post '/post/:id' do 
		post = Post.find(params[:id])
		post.update(params[:post])
		redirect "/channel/#{post.channel_id}"
	end

	get '/post/:id/delete' do 
		post = Post.find(params[:id])
		post.destroy
		redirect "/channel/#{post.channel_id}"
	end
end