require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before :each do
    @user = create(:user, name: 'Johannes Weber', photo: 'https://i.pravatar.cc/150?img=69')
    @first_post = create(:post, author: @user, title: 'First one')
    create(:post, author: @user, title: 'Second one')
    create(:post, author: @user, title: 'Third one')
  end

  it 'See the user profile picture' do
    visit user_path(@user)
    expect(page).to have_css("img[src='#{@user.photo}']")
  end

  it 'See the user username' do
    visit user_path(@user)
    expect(page).to have_content(@user.name)
  end

  it 'Number of posts the user has written' do
    visit user_path(@user)
    expect(page).to have_content("Number of posts: #{@user.postsCounter}")
  end

  it 'See the user bio' do
    visit user_path(@user)
    expect(page).to have_content(@user.bio)
  end

  it 'User first three posts' do
    visit user_path(@user)
    @user.three_recent_posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'See a button that lets me view all of a user posts.' do
    visit user_path(@user)
    expect(page).to have_button('See all posts')
  end
end
