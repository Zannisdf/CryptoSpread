class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  def index
    @users = User.order(:name)
  end

  def show; end

  def edit
    respond_to :js
  end

  def update
    if @user.update(user_params)
      respond_to :js
    else
      redirect_to user_path(@user), alert: 'There was an error, please try again.'
      respond_to :html
    end
  end

  private

  def user_params
    params.require(:user).permit(:ban)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
