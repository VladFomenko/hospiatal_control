# frozen_string_literal: true

class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include Clientable

  has_many :visits, dependent: :destroy
  has_many :doctors, through: :visits
end
