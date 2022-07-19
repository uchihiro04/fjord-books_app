# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]

  # GET /reports
  def index
    @reports = Report.order(:id).page(params[:page])
  end

  # GET /reports/1
  def show
    @report = Report.includes(comments: :user).find(params[:id])
    @comment = Comment.new
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit; end

  # POST /reports
  def create
    @report = current_user.reports.build(report_params)

    if @report.save
      redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      redirect_to report_url(@report), notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:title, :content)
  end

  def correct_user
    @report = current_user.reports.find_by(id: params[:id])
    redirect_to reports_path, alert: t('controllers.common.unauthorized_operations') if @report.nil?
  end
end
