# frozen_string_literal: true

class Doctor < ApplicationRecord
  include Doctorable

  has_many :visits, dependent: :destroy
  has_many :clients, through: :visits
  has_many :categories, dependent: :destroy
end
