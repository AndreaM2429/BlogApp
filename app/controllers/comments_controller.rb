class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @user = @post.author
    @current = current_user
    @comment = @post.comments.new
  end

  def index
    post = Post.find(params[:post_id])
    comments = post.comments
    render json: comments
  end

  def create
    post = Post.find(params[:post_id])

    json_request = JSON.parse(request.body.read)
    text = json_request['text']

    author = post.author

    comment = post.comment.new(text:, author:)

    return unless comment.save

    render json: comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    user = User.find(params[:user_id])
    return unless @comment.destroy

    @comment.update_comments_counter
    redirect_to user_post_path(user, @comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
