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
end
