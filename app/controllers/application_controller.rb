# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_client!
  before_action :authenticate_doctor!

end
