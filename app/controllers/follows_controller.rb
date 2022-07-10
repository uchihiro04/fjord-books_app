# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    current_user.follow(params[:following_id])
    redirect_to user_path(params[:following_id])
  end

  def destroy
    follow = Follow.find_by(id: params[:id])
    user = follow.following unless follow.nil?
    if current_user.unfollow(params[:id])
      redirect_to user_path(user)
    else
      redirect_to users_path, alert: t('controllers.common.alert_fail')
    end
  end
end
