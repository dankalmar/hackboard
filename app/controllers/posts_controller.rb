class PostsController < ApplicationController
	def index
	
		if params[:user_id]
			@posts = User.find(params[:user_id]).posts	
		else
			@posts = Post
		end
			@posts = @posts.includes(:comments)

	end

	def mine
		@posts = current_user.posts.all
	end


	def new
		@posts = Post.new
	end

	def create
		@post = Post.new(params[:post])
		if @post.save
			redirect_to posts_path
		else
			render :new
		end

	end


end
