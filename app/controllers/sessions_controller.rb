class SessionsController < ApplicationController
  def new; end

  def authenticated user
    if user.activated?
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash[:warning] = t("mailer.user.activation_error")
      redirect_to root_url
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      authenticated user
    else
      flash[:danger] = t(".invalid")
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
