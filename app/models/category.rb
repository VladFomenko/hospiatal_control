# frozen_string_literal: true

class Category < ApplicationRecord
  include Categorizable

  has_many :doctor
end
