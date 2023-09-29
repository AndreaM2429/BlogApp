class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @user = @post.author
    @current = current_user
    @comment = @post.comments.new
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(comment_params)
    comment.author = current_user
    if comment.save
      redirect_to user_post_path(post.author, post)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
