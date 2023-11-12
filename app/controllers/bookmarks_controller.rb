class BookmarksController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    bookmark = current_user.bookmark.new(question_id: question.id)
    bookmark.save
    redirect_to question_path(question)
  end

  def destroy
    question = Question.find(params[:question_id])
    bookmark = current_user.bookmark.find_by(question_id: question.id)
    bookmark.destroy
    redirect_to question_path(question)
  end
end
