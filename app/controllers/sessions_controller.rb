class SessionsController < ApplicationController
  def new
  end

  def create
  	
  	user=User.find_by(email: params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		flash[:success] = "Logged in"
  		log_in(user)
  		redirect_to user
  	else
  		flash.now[:error] = "Your email or password is incorrect"
  		render action: 'new'
  	end
  end

  def destroy
  	log_out
  	flash.now[:success] = "Bye Bye Lover"
  	redirect_to root_path
  end
end
