class AnswersController < ApplicationController

  def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.create(params[:answer].permit(:response))
		@answer.user_id = current_user.id if current_user
		@answer.save
		if@answer.save
			redirect_to question_path(@question)
		else
			render :new
		end
	end



  	def edit
		@question = Question.find(params[:question_id])
		@answer = @question.answers.find(params[:id])
	end

	def update
		@question = Question.find(params[:question_id])
		@answer = @question.answers.find(params[:id])

		if @answer.update(params[:answer].permit(:response))
			redirect_to question_path(@question)
		else
			render 'edit'
		end
	end

  def destroy
		@question = Question.find(params[:question_id])
		@answer = @question.answers.find(params[:id])
		@answer.delete
		redirect_to question_path(@question)
	end

	def vote
		if request.put?
		@answer=Answer.find(params[:id])
		@answer.liked_by current_user
		redirect_to :back
		elsif request.delete?

		@answer=Answer.find(params[:id])
		@answer.disliked_by current_user
		redirect_to :back
	end
	end
end
