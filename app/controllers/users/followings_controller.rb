class Users::FollowingsController < ApplicationController
  def index
    @user  = User.find(params[:user_id])
    @users = @user.followings.with_attached_avatar.order(:id).page(params[:page])
  end
end
