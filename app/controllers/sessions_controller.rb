class SessionsController < ApplicationController
  def new
  end

  def create
  	byebug
  	user=User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		flash[:success] = "Logged in"
  		redirect_to user
  	else
  		flash.now[:error] = "Your email or password is incorrect"
  		render action: 'new'
  	end
  end
end
