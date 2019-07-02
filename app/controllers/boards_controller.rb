class BoardsController < ApplicationController
  before_action :find_board, only: [:edit, :update, :destroy]

  def index
    @boards = current_user.boards
                          .active
                          .by_priority
                          .includes(:posts)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.new(valid_params)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def edit;end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(valid_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      format.js { @board.destroy }
    end
  end

  private

  def valid_params
    params.require(:board).permit(:title, :description, :priority,
                                  :header_background_color, :header_text_color)
  end

  def find_board
    @board = Board.find(params[:id])
  end

end
