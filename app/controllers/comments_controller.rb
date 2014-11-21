class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params.require(:comment).permit(:content, :user_id))
		@comment.user_id = current_user.id
		@comment.save

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end
end
