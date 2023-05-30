# frozen_string_literal: true

class Category < ApplicationRecord
  include Categorizable

  has_many :doctor, counter_cache: true
end
