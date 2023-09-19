class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def update_post_counter
    author.update(postsCounter: author.posts.count)
  end

  def five_recent_comments
    comment.limit(5).order(created_at: :desc)
  end
end
