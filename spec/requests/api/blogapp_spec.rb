require 'swagger_helper'

RSpec.describe 'api/my', type: :request do
  describe 'API' do
    path '/api/users/{user_id}/posts' do
      parameter name: 'user_id', in: :path, type: :integer
      get 'Return a post list from an user' do
        produces 'application/json'
        response '200', 'OK' do
          let(:user) { create(:user) }
          let(:user_id) { user.id }
          let(:new_post) { create(:post, author: user) }
          schema type: :array,
                 items: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     author_id: { type: :integer },
                     title: { type: :string },
                     text: { type: :string },
                     comments_counter: { type: :integer },
                     likes_counter: { type: :integer },
                     created_at: { type: :string },
                     updated_at: { type: :string }
                   },
                   required: %w[id author_id title text comments_counter likes_counter created_at
                                updated_at]
                 }
          run_test!
        end
      end
    end
  end

  describe 'API comments get endpoint' do
    path '/api/users/{user_id}/posts/{post_id}/comments' do
      parameter name: 'user_id', in: :path, type: :integer
      parameter name: 'post_id', in: :path, type: :integer
      get 'Return a comments list from a post' do
        produces 'application/json'
        response '200', 'OK' do
          let(:user) { create(:user) }
          let(:user_b) { create(:user) }
          let(:user_id) { user.id }
          let(:new_post) { create(:post, author: user) }
          let(:post_id) { new_post.id }
          let(:new_comment) { create(:comment, author: user_2) }
          schema type: :array,
                 items: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     author_id: { type: :integer },
                     text: { type: :string },
                     created_at: { type: :string },
                     updated_at: { type: :string }
                   },
                   required: %w[id author_id text created_at updated_at]
                 }
          run_test!
        end
      end
    end
  end
end
