class PostsController < ApplicationController
  before_action :require_login
  before_action :find_board
  before_action :find_post_from_board, only: [:edit, :update, :destroy]

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
    @post = find_post_from_board
  end

  def update
    @post = find_post_from_board
    if @post.update_attributes(valid_params)
      redirect_to boards_path
    else
      render :edit
    end
  end

  def destroy
    @post = find_post_from_board
    respond_to do |format|
      format.js { @post.destroy }
    end
  end

  private

  def find_board
    @board = Board.find(params[:board_id])
  end

  def valid_params
    params.require(:post).permit(:title, :description, :conclusion_deadline,
                                 :conclusion_date, attachments: [])
  end

  def find_post_from_board
    @board.posts
          .where(id: params[:id])
          .first
  end
end
