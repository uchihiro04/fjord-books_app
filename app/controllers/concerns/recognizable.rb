module Recognizable
  extend ActiveSupport::Concern

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    if @comment.nil?
      redirect_to @commentable, alert: t('controllers.common.unauthorized_operations') 
    end
  end
end
