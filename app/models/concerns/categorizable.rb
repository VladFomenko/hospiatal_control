# frozen_string_literal: true

module Categorizable
  extend ActiveSupport::Concern
  include Validatable

  included do
    validate_name(:name)
  end
end
