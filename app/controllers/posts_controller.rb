class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post=Post.new(post_params)
		@post.user = current_user

		if @post.save
      	  flash[:notice] = "Post posted!"
	      redirect_to posts_path
	    else
	      logger.debug("There was an error")
	  	end
	end

	def show
		@post=Post.find(params[:id])
	end

	def edit
		@post=Post.find(params[:id])
	end

	def update
		@post=Post.find(params[:id])

		# @post.user = current_user

		if @post.update_attributes(post_params)
      	  flash[:notice] = "Post saved!"
	      redirect_to posts_path
	    else
	      logger.debug("There was an error")
	  	end

	end

	private
	def post_params
		params.require(:post).permit(:content)
	end
end