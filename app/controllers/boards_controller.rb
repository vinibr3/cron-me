class BoardsController < ApplicationController
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
    params.require(:board).permit(:title, :description, :priority, :color)
  end
end
