require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:new_user) { create(:user) }

  describe 'GET /index' do
    it 'Returns http success' do
      get '/users'
      expect(response.status).to eq(200)
    end

    it 'Should render the template users/index' do
      get '/users'
      expect(response).to render_template('users/index')
    end

    it 'Body shold include "List of users" text' do
      get '/users'
      expect(response.body).to include('List of users')
    end
  end

  describe 'GET /show' do
    it 'Returns http success' do
      get "/users/#{new_user.id}"
      expect(response.status).to eq(200)
    end

    it 'Should render the template users/show' do
      get "/users/#{new_user.id}"
      expect(response).to render_template('users/show')
    end

    it 'Body shold include "List of users" text' do
      get "/users/#{new_user.id}"
      expect(response.body).to include('Info from specific user')
    end
  end
end
