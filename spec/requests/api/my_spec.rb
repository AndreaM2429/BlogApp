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
              required: ['id', 'author_id', 'title', 'text', 'comments_counter', 'likes_counter', 'created_at', 'updated_at']
            }
          run_test!
        end
      end
    end
  end
end
