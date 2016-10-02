class QuestionsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :logged_in_user, only: [:new, :create, :destroy]
  def new
  	@question=current_user.questions.build
  end

  def create
  	@question=current_user.questions.build(question_params)
  	if @question.save
  		redirect_to @question
  	else
  		render :new
  	end
  end

  def index
  	@questions=Question.all
  end

  def edit
  end

  def show
  	@question=Question.find(params[:id])
  end

  private

  	def question_params
  		params.require(:question).permit(:title)
  	end   	
  
end
