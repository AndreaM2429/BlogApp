module PostsHelper
  def show_all_post(user)
    tag = if user.postsCounter.positive?
            "<button>
              #{link_to 'See all posts', user_posts_path(user)}
            </button>"
          else
            "<span class='no-post'><Table>This user doesn't have posts yet</Table></span>"
          end
    tag.html_safe
  end

  def create_post(user)
    tag = ''

    return '' unless current_user == user

    tag << "<div class='btn-cont d-flex'>
             <button>#{link_to 'Create post', new_user_post_path(user)}</button>
           </div>"
    tag.html_safe
  end

  def delete_post(post, user)
    tag = ''

    return '' unless can?(:delete, post)

    tag << "<div class='d-flex btn-del'>
              #{button_to('Delete post', user_post_path(user, post), method: :delete, remote: true)}
            </div>"
    tag.html_safe
  end
end
