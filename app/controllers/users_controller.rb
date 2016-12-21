class UsersController < ApplicationController
  before_action :load_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t"register_sucess"
      log_in @user
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "success"
      redirect_to root_path
    else
      flash[:success] = t "fail"
      redirect_to request.referrer
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "not_found"
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
