# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :category_params, only: %i[create update]
  before_action :set_categories, only: :index
  before_action :set_category, only: %i[show update destroy]
  before_action :set_doctor, only: %i[]

  def index
    @categories
  end

  def show
    @category
  end

  def create
    category = Category.create(category_params)

    if category.save

    else

    end
  end

  def update
    if @category.update(category_params)

    else

    end
  end

  def destroy
    @category.destroy
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def set_categories
    @categories = category.all
  end

  def set_category
    @category = category.find(params[:id])
  end

  def category_params
    params.category.permit(:name)
  end
end
