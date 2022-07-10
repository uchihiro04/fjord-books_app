# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    current_user.follow(params[:following_id])
    redirect_to user_path(params[:following_id])
  end

  def destroy
      user = Follow.find(params[:id]).following
      current_user.unfollow(params[:id])
      redirect_to user_path(user)
  end
end
