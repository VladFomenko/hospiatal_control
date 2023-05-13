# frozen_string_literal: true

class VisitsController < ApplicationController
  before_action :visit_params, only: %i[create update]
  before_action :set_visits, only: :index
  before_action :set_visit, only: %i[show update destroy]

  def index
    @visits
  end

  def show
    @visit
  end

  def create
    visit = Visit.create(visit_params)

    if visit.save

    else

    end
  end

  def update
    if @visit.update(visit_params)

    else

    end
  end

  def destroy
    @visit.destroy
  end

  private

  def set_visits
    @visits = Visit.all
  end

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def visit_params
    params.visit.permit(:date_of_visit, :status, :recommendation, :phone_number, :password)
  end
end
