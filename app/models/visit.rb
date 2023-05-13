# frozen_string_literal: true

class Visit < ApplicationRecord
  include Validatable

  belongs_to :doctor
  belongs_to :client

  enum status: %i[active inactive]
end
