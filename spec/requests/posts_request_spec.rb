require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:new_user) { create(:user) }
  let(:new_post) { create(:post, author: new_user) }

  describe 'GET /index' do
    it 'Returns http success' do
      get "/users/#{new_user.id}/posts"
      expect(response.status).to eq(200)
    end

    it 'Should render the template posts/index' do
      get "/users/#{new_user.id}/posts"
      expect(response).to render_template('posts/index')
    end

    it 'Body shold include "List of users" text' do
      get "/users/#{new_user.id}/posts"
      expect(response.body).to include('List of posts, general views')
    end
  end

  describe 'GET /show' do
    it 'Returns http success' do
      get "/users/#{new_user.id}/posts/#{new_post.id}"
      expect(response.status).to eq(200)
    end

    it 'Should render the template users/index' do
      get "/users/#{new_user.id}/posts/#{new_post.id}"
      expect(response).to render_template('posts/show')
    end

    it 'Body shold include "List of users" text' do
      get "/users/#{new_user.id}/posts/#{new_post.id}"
      expect(response.body).to include('Post and its comments')
    end
  end
end
