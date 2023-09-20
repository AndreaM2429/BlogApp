require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    it 'Title empty or biger than 250 is invalid' do
      expect(build(:post, title: '')).not_to be_valid
      expect(build(:post, title: '...............................................
                                .................................................
                                .................................................
                                .................................................
                                .................................................
                                .................................................
                                .................................................
                                .................................................
                                .................................................
                                .....')).not_to be_valid
    end
    it 'Counters are less than 0 should be invalid' do
      expect(build(:post, comments_counter: -2)).to_not be_valid
    end
    it 'Should be valid' do
      expect(build(:post)).to be_valid
    end
  end

  describe 'Associatons' do
    it { should belong_to(:author) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'Methods' do
    let(:new_user) { create(:user) }
    let(:new_post) { create(:post, author: new_user) }
    let(:comments_list) { create_list(:comment, 10, post: new_post) }
    let(:recent_comments) { new_post.five_recent_comments }

    it 'Show three recent posts' do
      expect(recent_comments).to eq(comments_list.reverse.take(5))
    end
    it 'Update post counter' do
      expect { create(:post, author: new_user) }.to change { new_user.reload.postsCounter }.by(1)
    end
  end
end
