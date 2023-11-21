class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :check_guest, only: %i[update destroy]
  before_action :set_user, only: [:bookmarks]


  def show
    @user = User.find(params[:id])
    @user_questions = @user.question.order(created_at: :desc).page(params[:page])
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def index
    @question = Question.all
    @tag_list = Tag.all
    redirect_to user_path
  end

  def bookmarks
    @bookmark = Bookmark.where(user_id: params[:id]).pluck(:question_id)
    @question_bookmark = Question.find(@bookmark)
    @quesiton = Question.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  #他ユーザーからのアクセス
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to questions_path
    end
  end

 def check_guest
  if current_user.email == 'guest@example.com'
   redirect_to root_path, alert: 'ゲストユーザーの編集・削除はできません。'
  end
 end

  #ブックマーク機能
 def set_user
   @user = User.find(params[:id])
 end
end
