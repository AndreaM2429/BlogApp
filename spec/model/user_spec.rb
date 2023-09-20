require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'Name empty is invalid' do
      expect(build(:user, name: '')).not_to be_valid
    end
    it 'Counters are less than 0 should be invalid' do
      expect(build(:user, postsCounter: -2)).to_not be_valid
    end
    it "Should be valid, even if don't pass value for the postsCounter wich default value is 0" do
      expect(build(:user)).to be_valid
    end
  end

  describe 'Associatons' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'Methods' do
    let(:new_user) { create(:user) }
    let!(:posts_list) { create_list(:post, 5, author: new_user) }
    let!(:recent_posts) { new_user.three_recent_posts }

    it 'Show three recent posts' do
      expect(recent_posts).to eq(posts_list.reverse.take(3))
    end
  end
end
