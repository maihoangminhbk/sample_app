class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :find_user_for_create, only: :create
  before_action :find_user_for_destroy, only: :destroy

  def create
    current_user.follow(@user)
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  def destroy
    current_user.unfollow(@user)
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  private
  def find_user_for_create
    @user = User.find_by id: params[:followed_id]
    return if @user

    flash[:danger] = t ".not_found"
    redirect_to root_url
  end

  def find_user_for_destroy
    @user = Relationship.find_by(id: params[:id]).followed
    return if @user

    flash[:danger] = t ".not_found"
    redirect_to root_url
  end
end
