class BoardsController < ApplicationController
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

  private

  def valid_params
    params.require(:board).permit(:title, :description, :priority,
                                  :header_background_color, :header_text_color)
  end
end
