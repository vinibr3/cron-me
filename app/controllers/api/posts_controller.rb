class Api::PostsController < ApplicationController
  before_action :find_board

  def create
    post = @board.posts.new(valid_params)
    if post.save
      head :ok
    else
      error_message = post.errors.full_messages
      render json: { type: 'erro',
                     message: error_message }, status: 422
    end
  end

  private

  def valid_params
    params.require(:post).permit(:title, :description, :conclusion_deadline)
  end

  def find_board
    @board = Board.find(params[:board_id])
  end
end
