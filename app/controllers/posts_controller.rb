class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    @posts = @user.posts.includes(comments: :author).page(params[:page]).per(4)
  end

  def new
    @user_current = current_user
    @post_new = @user_current.posts.new
  end

  def create
    post = current_user.posts.new(posts_params)
    if post.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @liked = like_exist?(@post, current_user)
  end

  def createlike
    @post = Post.find(params[:id])
    Like.create(post: @post, author: current_user)
    redirect_to user_post_path(@post.author, @post)
  end

  def deletelike
    @post = Post.find(params[:id])
    @like = @post.likes.find_by(author: current_user)
    @like.destroy
    @like.update_likes_counter
    redirect_to user_post_path(@post.author, @post)
  end

  private

  def posts_params
    params.require(:post).permit(:title, :text)
  end

  def like_exist?(post, user_id)
    post.likes.where(author: user_id).exists?
  end
end
