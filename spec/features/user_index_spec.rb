require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before :each do
    @first_user = create(:user, name: 'Johannes Weber', photo: 'https://i.pravatar.cc/150?img=69')
    @second_user = create(:user, name: 'Santiago Sánchez', photo: 'https://i.pravatar.cc/150?img=58')
    @third_user = create(:user, name: 'Élise Moreau', photo: 'https://i.pravatar.cc/150?img=9')
  end

  it 'Name for all the users' do
    visit users_path
    expect(page).to have_content 'Johannes Weber'
    expect(page).to have_content 'Santiago Sánchez'
    expect(page).to have_content 'Élise Moreau'
  end

  it 'See the photo for all the users' do
    visit users_path
    expect(page).to have_css("img[src='#{@first_user.photo}']")
    expect(page).to have_css("img[src='#{@second_user.photo}']")
    expect(page).to have_css("img[src='#{@third_user.photo}']")
  end

  it 'Show corrent number of posts each user has written' do
    create_list(:post, 3, author: @first_user)
    create_list(:post, 2, author: @second_user)
    create_list(:post, 7, author: @third_user)
    visit users_path
    expect(page).to have_content("Number of posts: #{@first_user.postsCounter}")
    expect(page).to have_content("Number of posts: #{@second_user.postsCounter}")
    expect(page).to have_content("Number of posts: #{@third_user.postsCounter}")
  end
end
