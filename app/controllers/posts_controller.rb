class PostsController < ApplicationController
  before_action :find_board

  def new
    @board = find_board
    @post = @board.posts.new
  end

  def create
    @post = find_board.posts.new(valid_params)
    if @post.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def edit
    @post = @board.posts
                  .where(id: params[:id])
                  .first
  end

  def update
    @post = @board.posts
                  .where(id: params[:id])
                  .first
    if @post.update_attributes(valid_params)
      redirect_to boards_path
    else
      render :edit
    end
  end

  private

  def find_board
    @board = Board.find(params[:board_id])
  end

  def valid_params
    params.require(:post).permit(:title, :description, :conclusion_deadline, :conclusion_date)
  end
end
