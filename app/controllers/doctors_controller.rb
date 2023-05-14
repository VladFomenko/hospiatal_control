# frozen_string_literal: true

class DoctorsController < ApplicationController
  include Doctorable

  before_action :doctor_params, only: %i[create update]
  before_action :set_doctors, only: :index
  before_action :set_doctor, only: %i[show update destroy]

  def index
    @doctors
  end

  def show
    @doctor
  end

  def create
    doctor = Doctor.create(doctor_params)

    if doctor.save

    else

    end
  end

  def update
    if @doctor.update(doctor_params)

    else

    end
  end

  def destroy
    @doctor.destroy
  end

  def set_category
    change_category(@doctor, doctor_params[:category])
  end

  private

  def set_doctors
    @doctors = Doctor.all
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.doctor.permit(:first_name, :second_name, :password, :work_experience, :category)
  end
end
