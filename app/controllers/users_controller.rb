class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :find_user, only: %i(show destroy edit update)
  before_action :correct_user, only: %i(edit update)

  def index
    @pagy, @users = pagy(User.all, items: Settings.pagy.size)
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = t("global.flash.user.signup.success")
      redirect_to @user
    else
      flash[:danger] = t("global.flash.user.signup.invalid")
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = t("global.flash.user.edit.success")
      redirect_to @user
    else
      flash[:danger] = t("global.flash.user.edit.invalid")
      render "edit"
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t("users.delete.success")
    else
      flash[:danger] = t("users.delete.fail")
    end
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t("global.flash.user.login.require")
    redirect_to login_url
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "global.flash.find.not_found"
    redirect_to root_path
  end
end
