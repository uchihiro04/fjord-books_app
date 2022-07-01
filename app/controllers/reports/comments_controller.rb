class Reports::CommentsController <  CommentsController
  before_action :set_commentable, only: %i[create]
  before_action :set_render_template, only: %i[create]

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def set_render_template
    @render_template = 'reports/show'
    @report = Report.find(params[:report_id])
  end
end
