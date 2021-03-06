class CommentsController < ApplicationController

	def create
		post = Post.find(params[:comment].delete(:post_id))
		
		@comment = post.comments.build(params[:comment])
		
		if @comment.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

end
