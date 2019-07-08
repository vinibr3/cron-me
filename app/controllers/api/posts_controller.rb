class Api::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_board

  def create
    post = @board.posts.new(valid_params)
    head :ok if post.save!
  rescue StandardError => error
    error_message = error.message + '\n' + error.backtrace.join('\n')
    render json: { type: 'error',
                   message: error_message }, status: 422
  end

  private

  def valid_params
    params.require(:post).permit(:title, :description, :conclusion_deadline)
  end

  def find_board
    @board = Board.find(params[:board_id])
  end
end
