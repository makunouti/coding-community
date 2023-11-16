class QuestionsController < ApplicationController
  #検索機能
  before_action :set_q, only: [:index, :search]

  def new
    @question = Question.new
    @tag_list = Tag.all
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    tags_list = params[:question][:name].split(',')
    if @question.save
      @question.save_question_tags(tags_list)
      redirect_to questions_path
    else
      render :new
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path
  end

  def index
    @questions = Question.order(created_at: :desc).page(params[:page])
    @tag_lists = Tag.all
    @results = @q.result
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @tag_list = @question.tags.pluck(:name).join(',')
    @question_tags = @question.tags
  end

  def edit
    @question = Question.find(params[:id])
    @tag_list = @question.tags.pluck(:name).join(',')
  end

  def update
    @question = Question.find(params[:id])
    tag_list = params[:question][:name].split(',')
    if @question.update(question_params)
      @question.tags.save_question_tags(tag_list)
      redirect_to questions_path
    end
  end

  def search
    @results = @q.result
  end

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @question = @tag.questions
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :tag_name)
  end

  #検索機能
  def set_q
    @q = Question.ransack(params[:q])
  end
end