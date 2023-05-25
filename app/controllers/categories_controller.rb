# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :category_params, only: %i[create update]
  before_action :set_categories, only: :index
  before_action :set_category, only: %i[show update destroy]

  def index
    @categories
  end

  def show
    @category
  end

  def create
    if @category.create(category_params)
      flash[:success] = 'Update was successful'
      redirect_to category_path(@category)
    else
      flash[:errors] = @category.errors.full_messages.join(', ')
      redirect_to new_category_path(@category)
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Update was successful'
      redirect_to category_path(@category)
    else
      flash[:errors] = @category.errors.full_messages.join(', ')
      redirect_to new_category_path(@category)
    end
  end

  def destroy
    @category.destroy
  end

  private

  def set_categories
    @categories = Category.all
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.category.permit(:name)
  end
end
