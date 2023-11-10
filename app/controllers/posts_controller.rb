class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.name = current_user.name
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    is_matching_login_user
    @post = Post.find(params[:id])
  end

  def update
    #作成したアクセス制限メソッド
    is_matching_login_user
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    @post.name = current_user.name
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  #URLの直打ちに対するアクセス制限
  def is_matching_login_user
  user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to posts_path
    end
  end
end
