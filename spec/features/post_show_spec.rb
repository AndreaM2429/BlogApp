require 'rails_helper'

RSpec.describe 'Posts index page', type: :feature do
  before :each do
    @user = create(:user, name: 'Johannes Weber', photo: 'https://i.pravatar.cc/150?img=69')
    @first_post = create(:post, author: @user, title: 'First one')
    create(:comment, author: @user, post: @first_post, text: 'Cooment one')
    create(:comment, author: @user, post: @first_post, text: 'Cooment two')
    create(:comment, author: @user, post: @first_post, text: 'Cooment three')
    create(:comment, author: @user, post: @first_post, text: 'Cooment four')
    create(:like, author: @user, post: @first_post)
  end

  it 'See the posts title' do
    visit user_post_path(@user, @first_post)
    expect(page).to have_content(@first_post.title)
  end

  it 'See who wrote the post' do
    visit user_post_path(@user, @first_post)
    expect(page).to have_content(@user.name)
  end

  it 'See how many comments a post has' do
    visit user_posts_path(@user)
    expect(page).to have_content("Comments: #{@first_post.comments_counter}")
  end

  it 'See how many likes a post has' do
    visit user_posts_path(@user)
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end

  it 'See the post body' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.text)
  end

  it 'See the username and the text of each commentor' do
    visit user_path(@user)
    @first_post.comments do |comment|
      expect(page).to have_content("#{comment.author.name}: #{comment.text}")
    end
  end
end
