class LabelsController < ApplicationController
  before_action :require_login
  before_action :find_label_from_user, only: [:edit, :update, :destroy]

  def index
    @labels = current_user.labels
  end

  def new
    @label = current_user.labels.new
  end

  def create
    @label = current_user.labels.new(valid_params)
    if @label.save
      redirect_to user_labels_path(current_user)
    else
      render :new
    end
  end

  def edit
    @label = find_label_from_user
  end

  def update
    @label = find_label_from_user
    if @label.update_attributes(valid_params)
      redirect_to user_labels_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @label = find_label_from_user
    respond_to do |format|
      format.js { @label.destroy }
    end
  end

  private

  def valid_params
    params.require(:label).permit(:title, :background_color)
  end

  def find_label_from_user
    current_user.labels
                .where(id: params[:id])
                .first
  end
end
