class PostsController < ApplicationController
	before_action :user_signed?, only: [:new, :create]

	def new
		@post = Post.new
	end

	def index
		@posts = Post.all
	end	
	
	def create
		@post = Post.new(title: params[:title], body: params[:post][:body], user_id: current_user.id)
		user = current_user
		@post.user_id = user.id
		if @post.valid?
			puts "validno"
			@post.save
			redirect_to posts_path
		else
		  render 'new'
		 end 	
 
	end	

	private

	#def post_params
	#	params.require(:post).permit(:title, :body)
	#end	


end
