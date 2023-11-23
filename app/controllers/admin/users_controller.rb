class Admin::UsersController < ApplicationController
    def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update #顧客情報アプデ
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:update] = "You have updated user info successfully."
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end
end
