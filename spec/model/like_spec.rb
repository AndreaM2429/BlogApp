require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Associatons' do
    it { should belong_to(:author) }
    it { should belong_to(:post) }
  end

  describe 'Methods' do
    let(:new_user) { create(:user) }
    let(:new_post) { create(:post, author: new_user) }
    it 'Update likes counter' do
      expect { create(:like, author: new_user, post: new_post) }.to change { new_user.reload.postsCounter }.by(1)
    end
  end
end
