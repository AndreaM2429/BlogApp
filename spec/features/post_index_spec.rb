require 'rails_helper'

RSpec.describe 'Posts show page', type: :feature do
  before :each do
    @user = create(:user, name: 'Johannes Weber', photo: 'https://i.pravatar.cc/150?img=69')
    @first_post = create(:post, author: @user, title: 'First one')
    create(:post, author: @user, title: 'Second one')
    create(:post, author: @user, title: 'Third one')
    create(:comment, author: @user, post: @first_post, text: 'Cooment one')
    create(:comment, author: @user, post: @first_post, text: 'Cooment two')
    create(:comment, author: @user, post: @first_post, text: 'Cooment three')
    create(:comment, author: @user, post: @first_post, text: 'Cooment four')
    create(:like, author: @user, post: @first_post)
  end

  it 'See the user profile picture' do
    visit user_posts_path(@user)
    expect(page).to have_css("img[src='#{@user.photo}']")
  end

  it 'See the user username' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.name)
  end

  it 'Number of posts the user has written' do
    visit user_posts_path(@user)
    expect(page).to have_content("Number of posts: #{@user.postsCounter}")
  end

  it 'See the posts title' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.title)
  end

  it 'See some of the post body' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.text[0..85])
  end

  it 'See the first comments on a post' do
    visit user_posts_path(@user)
    @user.posts do |post|
      comments = post.five_recent_comments
      expect(page).to have_content(comments[0].text)
    end
  end

  it 'See how many comments a post has' do
    visit user_posts_path(@user)
    expect(page).to have_content("Comments: #{@first_post.comments_counter}")
  end

  it 'See how many likes a post has' do
    visit user_posts_path(@user)
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end
end
