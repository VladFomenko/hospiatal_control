# frozen_string_literal: true

class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  include Clientable

  before_validation :normalize_phone_number

  has_one_attached :avatar

  has_many :visits, dependent: :destroy
  has_many :doctors, through: :visits

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def normalize_phone_number
    phone_number.gsub!(/[\s-]/, '')
  end
end
