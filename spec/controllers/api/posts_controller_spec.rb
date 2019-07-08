require 'rails_helper'

def post_params
  board = create(:board)
  {
    post: {
            title: Faker::Lorem.sentence,
            description: Faker::Lorem.paragraph,
            conclusion_deadline: Faker::Date.forward(30).to_date.to_s
          },
    board_id: board.id
  }
end

RSpec.describe Api::PostsController, type: :controller do
  describe 'POST create' do
    before do
      post :create, params: post_params
    end

    it 'create post' do
      expect(Post.count).to eq(1)
    end
  end
end
