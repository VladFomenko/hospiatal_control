# frozen_string_literal: true

class VisitsController < ApplicationController
  before_action :current_dynamic_user, only: %i[index show create update edit]
  before_action :visit_params, only: %i[create update]
  before_action :set_visits, only: :index
  before_action :set_visit, only: %i[show update destroy edit]

  load_and_authorize_resource :doctor
  load_and_authorize_resource :doctor, through: :visits

  load_and_authorize_resource :client
  load_and_authorize_resource :client, through: :visits

  def index
    @visits
  end

  def show
    @visit
  end

  def create
    @visit ||= @current_dynamic_user.visits.build(visit_params)

    if check_quantity_visits? && @visit.save
      redirect_to client_visit_path(current_client, @visit)
    else
      flash[:errors] = check_quantity_visits? ? 'Failed to create visit' : 'This doctor can no longer have visits'
      redirect_to new_client_visit_path(current_client, @visit)
    end
  end

  def update
    if @visit.update(visit_params)
      @visit.inactive!
      flash[:success] = 'Update was successful'
      redirect_to doctor_visit_path(current_doctor, @visit)
    else
      flash[:errors] = @visit.errors.full_messages.join(', ')
      redirect_to edit_doctor_visit_path(current_doctor, @visit)
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

  def current_ability
    user = current_client || current_doctor
    @current_ability ||= Ability.new(user)
  end

  def set_visits
    sort_column = params[:sort_column]

    sorted_visits = @current_dynamic_user.visits.sort_by { |visit| visit[sort_column] }
    @visits = Kaminari.paginate_array(sorted_visits).page(params[:page]).per(10)

    @total_pages = @visits.total_pages
  end

  def set_visit
    @visit = @current_dynamic_user.visits.find(params[:id])
  end

  def check_quantity_visits?
    Doctor.find(visit_params[:doctor_id]).visits.where(status: 'active').count <= 9
  end

  def visit_params
    params.require(:visit).permit(:date_of_visit, :status, :recommendation, :doctor_id)
  end
end
