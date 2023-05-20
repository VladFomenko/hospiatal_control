# frozen_string_literal: true

class VisitsController < ApplicationController
  before_action :visit_params, only: %i[create update]
  before_action :set_visits, only: :index
  before_action :set_visit, only: %i[show update destroy edit]
  before_action :current_dynamic_user, only: %i[create show]

  def index
    @visits
  end

  def show
    @visit
  end

  def create
    @visit ||= @current_dynamic_user.visits.build(visit_params)

    if check_quantity_visits? && @visit.save!
      redirect_to client_visit_path(current_client, @visit), notice: 'Visit successfully created'
    else
      flash[:notice] = 'Failed to create visit'
      flash[:notice_class] = 'alert-danger'
      render :new
    end
  end

  def update
    if @visit.update(visit_params)
      @visit.inactive!
      redirect_to doctor_visit_path(@visit)
    else
      render :edit, notice: 'Failed to update visit'
    end
  end

  def destroy
    @visit.destroy
  end

  def new
    @visit = current_client.visits.build
  end

  def edit
    @visit
  end

  private

  def set_visits
    sort_column = params[:sort_column]

    @visits = current_dynamic_user.visits.sort_by { |visit| visit[sort_column] }
  end

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def check_quantity_visits?
    Doctor.find(visit_params[:doctor_id]).visits.where(status: 'active').count <= 9
  end

  def visit_params
    params.require(:visit).permit(:date_of_visit, :status, :recommendation, :doctor_id)
  end
end
