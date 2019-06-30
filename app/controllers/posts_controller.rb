class PostsController < ApplicationController
  before_action :find_board_to_create_post, only: [:new, :create]

  def new
    @board = find_board_to_create_post
    @post = @board.posts.new
  end

  def create
    @post = find_board_to_create_post.posts.new(valid_params)
    if @post.save
      redirect_to boards_path
    else
      render :new
    end
  end

  private

  def find_board_to_create_post
    Board.find(params[:board_id])
  end

  def valid_params
    params.require(:post).permit(:title, :description, :conclusion_deadline)
  end
end
