# frozen_string_literal: true

module Doctorable
  extend ActiveSupport::Concern
  include Validatable

  included do
    validate_name
    validate_name(:second_name)
    validate_phone_number
    validate_password
    validate_work_experience
    validate :phone_number_exist, on: :login
    validate :password_exist, on: :login
  end
end
