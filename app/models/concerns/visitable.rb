# frozen_string_literal: true

module Visitable
  extend ActiveSupport::Concern
  include Validatable

  included do
    validate_date_of_visit
  end
end
