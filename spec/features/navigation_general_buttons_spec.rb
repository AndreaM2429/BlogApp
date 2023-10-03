require 'rails_helper'

RSpec.describe 'Button navigations between pages' do
  before :each do
    @user = create(:user, name: 'Johannes Weber', photo: 'https://i.pravatar.cc/150?img=69')
    @first_post = create(:post, author: @user, title: 'First one')
  end

  it 'Button All Users has to redirect to users index' do
    visit user_posts_path(@user)
    click_link 'All Users'
    expect(page).to have_current_path(users_path)
  end

  it 'Button User bio has to redirect to posts index' do
    visit user_posts_path(@user)
    click_link 'User bio'
    expect(page).to have_current_path(user_path(@user))
  end

  it 'Button Create post has to redirect to posts new' do
    visit user_path(@user)
    click_link 'Create post'
    expect(page).to have_current_path(new_user_post_path(@user))
  end

  it 'Button Create comment has to redirect to comments new' do
    visit user_post_path(@user, @first_post)
    click_link 'Create comment'
    expect(page).to have_current_path(new_user_post_comment_path(@user, @first_post))
  end
end
