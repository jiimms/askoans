class UsersController < ApplicationController
 
  def index
    @users=User.all
  end

  def new
  	@user=User.new
  end

  def create
  	@user=User.new(user_params)
  	if @user.save
      flash[:success] = "Welcome to the Dark Web"
  		redirect_to @user
  	else
      flash[:danger] = "Please correct the errors below" 
  		render :new
  	end
  end

  def edit
    @user=User.find(params[:id])
  end

    def update
    @user=User.find_by(params[:id])
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
    @user=User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
