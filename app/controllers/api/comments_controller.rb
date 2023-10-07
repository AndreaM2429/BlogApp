class Api::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

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

    comment = post.comments.new(text:, author:)

    if comment.save
      render json: comment, status: :created
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
