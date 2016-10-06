class QuestionsController < ApplicationController
   before_action :set_question, only: [:edit, :update, :show, :destroy]
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

  def update  
      if @question.update(question_params)
        redirect_to root_path
      else
        render :edit
      end  
  end

  def show
  end

  def destroy
    @question.delete
    redirect_to root_path
  end

  def upvote 
    @question=Question.find(params[:id])
    @question.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @question=Question.find(params[:id])
    @question.downvote_by current_user
    redirect_to :back
  end

  private

  	def question_params
  		params.require(:question).permit(:title)
  	end   	

    def set_question
      @question=Question.find(params[:id])
    end
  
end
