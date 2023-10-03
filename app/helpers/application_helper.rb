module ApplicationHelper
  def trim_post_text(text)
    text.length <= 85 ? text : "#{text[0..85]}..."
  end

  def buttons_new_actions
    nav = ''
    if controller_name == 'posts' && action_name == 'new'
      nav << "<button>#{link_to 'User posts', user_posts_path}</button>"
    end
    if controller_name == 'comments' && action_name == 'new'
      nav << "<button>#{link_to 'Back to post', user_post_path(@user, @post)}</button>"
    end
    nav
  end

  def navigation_buttons
    nav = ''
    unless controller_name == 'users' && action_name == 'index'
      nav = "<button>#{link_to 'All Users', users_path}</button>"
    end
    if controller_name == 'posts' && action_name == 'index'
      nav << "<button>#{link_to 'User bio', user_path(@user)}</button>"
    end
    if controller_name == 'posts' && action_name == 'show'
      nav << "<button>#{link_to 'User posts', user_posts_path}</button>"
    end
    nav << buttons_new_actions
    nav.html_safe
  end

  def add_like
    if @liked
      button_to "Don't like", deletelike_user_post_path(@post.author, @post), method: :delete, class: 'btn-like'
    else
      button_to 'Like', createlike_user_post_path(@post.author, @post), method: :post, class: 'btn-like'
    end
  end
end
