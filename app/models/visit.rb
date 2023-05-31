# frozen_string_literal: true

class Visit < ApplicationRecord
  include Visitable

  belongs_to :doctor, counter_cache: true
  belongs_to :client, counter_cache: true

  enum status: %i[active inactive]
end
