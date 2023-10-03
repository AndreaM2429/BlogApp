require 'rails_helper'

RSpec.describe 'User links navigations', type: :feature do
  before :each do
    @first_user = create(:user, name: 'Johannes Weber', photo: 'https://i.pravatar.cc/150?img=69')
    @second_user = create(:user, name: 'Santiago Sánchez', photo: 'https://i.pravatar.cc/150?img=58')
    @third_user = create(:user, name: 'Élise Moreau', photo: 'https://i.pravatar.cc/150?img=9')

    @first_post = create(:post, author: @first_user, title: 'First one')
    create(:post, author: @first_user, title: 'Second one')
    create(:post, author: @first_user, title: 'Third one')
  end

  describe 'When I click on a user, redirected to that user show page.' do
    it 'Check link for first user' do
      visit users_path
      click_link 'Johannes Weber'
      expect(page).to have_current_path(user_path(@first_user))
    end
    it 'Check link for second user' do
      visit users_path
      click_link 'Santiago Sánchez'
      expect(page).to have_current_path(user_path(@second_user))
    end
    it 'Check link for third user' do
      visit users_path
      click_link 'Élise Moreau'
      expect(page).to have_current_path(user_path(@third_user))
    end
  end

  it 'Click a user post, it redirects to that post show page.' do
    visit user_path(@first_user)
    click_link @first_post.title
    expect(page).to have_current_path(user_post_path(@first_user, @first_post))
  end

  it 'Click to see all posts, it redirects to the user post index page' do
    visit user_path(@first_user)
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@first_user))
  end
end
