module CommentsHelper
  def comments_exist?(comments, post)
    tag = if comments.positive?
            "<ul class='border comments-list'>
              #{render partial: 'partials/comments_card', collection: post.comments, as: :comment}
            </ul>"
          else
            ''
          end
    tag.html_safe
  end

  def show_all_comments(post)
    tag = if post.comments_counter.positive?
            "<ul class='border comments-list'>
              #{render partial: 'partials/comments_card', collection: post.comments, as: :comment}
            </ul>"
          else
            "<ul class='border comments-list'>
              <li>No comments yet</li>
            </ul>"
          end
    tag.html_safe
  end
end
