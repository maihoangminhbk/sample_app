class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :find_user, only: %i(show destroy edit update)
  before_action :correct_user, only: %i(edit update)

  def index
    @pagy, @users = pagy(User.all, items: Settings.pagy.size)
  end

  def show
    @pagy, @microposts = pagy(@user.microposts.newest,
                              items: Settings.pagy.size)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = t(".check_email")
      redirect_to root_url

    else
      flash[:danger] = t(".invalid")
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = t(".success")
      redirect_to @user
    else
      flash[:danger] = t(".invalid")
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t(".success")
    else
      flash[:danger] = t(".fail")
    end
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t ".not_found"
    redirect_to root_path
  end
end
