require 'rails_helper'

RSpec.describe 'Post links navigations and pagination', type: :feature do
  before :each do
    @user = create(:user, name: 'Johannes Weber', photo: 'https://i.pravatar.cc/150?img=69')
    @first_post = create(:post, author: @user, title: 'First one')
  end

  it 'See a section for pagination if there are more posts than fit on the view' do
    visit user_posts_path(@user)
    create_list(:post, 5, author: @user)
    expect(page).to have_css('.pagination')
  end

  it 'Click on a post, it redirects to that post show page' do
    visit user_posts_path(@user)
    click_link @first_post.title
    expect(page).to have_current_path(user_post_path(@user, @first_post))
  end
end
