# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user_based_on_role, except: :home
  before_action :configure_sign_up_params, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from CanCan::AccessDenied, with: :no_permission

  def configure_sign_up_params
    if resource_class == Client
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name second_name birth_date])
    elsif resource_class == Doctor
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name second_name work_experience])
    else
      super
    end
  end

  def after_sign_up_path_for(resource)
    if resource.instance_of?(Client)
      client_path(current_client)
    elsif resource.instance_of?(Doctor)
      doctor_path(current_doctor)
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Client)
      client_path(current_client)
    elsif resource.is_a?(Doctor)
      doctor_path(current_doctor)
    else
      root_path
    end
  end

  def current_dynamic_user
    @current_dynamic_user = Client.find_by_id(params[:client_id]) || Doctor.find_by_id(params[:doctor_id])
  end

  private

  def no_permission
    render 'errors/no_permission', status: :not_found
  end

  def not_found
    render 'errors/404', status: :not_found
  end

  def authenticate_user_based_on_role
    if current_client
      authenticate_client!
    elsif current_doctor
      authenticate_doctor!
    end
  end
end
