# frozen_string_literal: true

class MainController < ApplicationController
  def home
    if client_signed_in?
      redirect_to client_path(current_client)
    elsif doctor_signed_in?
      redirect_to doctor_path(current_doctor)
    else
      root_path
    end
  end
end
