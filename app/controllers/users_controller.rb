class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  def index
    @users=User.all
  end

  def new
  	@user=User.new
  end

  def create
  	@user=User.new(user_params)
  	if @user.save
      session[:user_id] =@user.id
      flash[:success] = "Welcome to the Dark Web"
      log_in(@user)
  		redirect_to @user
  	else
      flash[:danger] = "Please correct the errors below" 
  		render :new
  	end
  end

  def edit
  end

    def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash[:danger] = "Please correct the errors below" 
      render :edit
    end
  end


  def show
  	@user=User.find(params[:id])
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  	end
end
