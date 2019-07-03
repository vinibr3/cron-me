class PostLabelsController < ApplicationController
  before_action :require_login
  before_action :find_current_user_post

  def create
    respond_to do |format|
      format.js { @post_label = @post.label_posts.create(valid_params) }
    end
  end

  def destroy
    @post_label = @post.label_posts.where(label_id: params[:id]).first
    respond_to do |format|
      format.js { @post_label.destroy }
    end
  end

  private

  def valid_params
    params.permit(:label_id)
  end

  def find_current_user_post
    @post = current_user.posts.find_by(id: params[:post_id])
  end
end
