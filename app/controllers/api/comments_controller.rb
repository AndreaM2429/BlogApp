class Api::CommentsController < ApplicationController
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
end
