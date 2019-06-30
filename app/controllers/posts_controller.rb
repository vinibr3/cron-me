class PostsController < ApplicationController
  before_action :find_board_to_create_post, only: [:new, :create]

  def new
    @post = find_board_to_create_post.posts.new
  end

  private

  def find_board_to_create_post
    Board.find(params[:board_id])
  end

  def valid_params
    params.require(:post).permit(:title, :description, :conslusion_deadline)
  end
end
