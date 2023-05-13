# frozen_string_literal: true

class Client < ApplicationRecord
  include Clientable

  # has_many :doctors, through: visits
end
