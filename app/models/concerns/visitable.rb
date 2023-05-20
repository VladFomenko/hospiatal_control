# frozen_string_literal: true

module Visitable
  extend ActiveSupport::Concern
  include Validatable

  included do
    date_of_visit
    status
    validate_recommendation
  end
end
