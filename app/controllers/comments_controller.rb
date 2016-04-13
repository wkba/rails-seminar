class CommentsController < ApplicationController
  def create
    comment_params = params.require(:comment).permit(:body)
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end
end
