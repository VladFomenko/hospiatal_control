# frozen_string_literal: true

module Clientable
  extend ActiveSupport::Concern
  include Validatable

  included do
    validate_name
    validate_name(:second_name)
    validate_birth_date
    validate_phone_number
    validate_password
    validate :phone_number_exist, on: :login
    validate :password_exist, on: :login
  end
end
