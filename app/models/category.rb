# frozen_string_literal: true

class Category < ApplicationRecord
  include Categorizable

  belongs_to :doctor
end
