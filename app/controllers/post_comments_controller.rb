class PostCommentsController < ApplicationController

  def create
  end

  private

  def comment_params
    params.require(:post_comment).permit(:comment)
  end
end
