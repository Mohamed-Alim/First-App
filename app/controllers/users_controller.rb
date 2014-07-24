class UsersController < ApplicationController
  before_filter :signed_in_user, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  def new
  	@user = User.new
  end
  def index
    
  end
  def show
  	@user = User.find(params[:id])
  end
  def create

  	@user = User.new(user_params)
  	puts @user.inspect
  	if @user.save
      sign_in @user
      flash[:notice] = "User successfully created"
  		redirect_to user_path(@user)
  	else
  		puts "ERRORS ARE"
  		puts @user.errors.inspect
  		render 'new'
  	end
  end

  def edit
  # @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:notice] = "Profile successfully updated"
      sign_in @user
    else
      #redirect_to edit_user_path(@user)
      render 'edit'
    end
  end


  private
  def signed_in_user
    unless signed_in?
      store_location
      flash[:error] = "Please Sign in"
      redirect_to root_path unless signed_in?
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
