# frozen_string_literal: true

class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include Doctorable

  has_many :visits, dependent: :destroy
  has_many :clients, through: :visits
  has_many :categories, dependent: :destroy
end
