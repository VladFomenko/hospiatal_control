# frozen_string_literal: true

module Validatable
  extend ActiveSupport::Concern
  include Constable

  included do
    def self.validate_name(field = :first_name)
      validates field, presence: true,
                       length: Constable::RANGE_NAME_LENGTH,
                       format: {
                         with: Constable::REGEXP_NAME,
                         message: 'Only latin letters and you can use only space or hyphen'
                       }
    end

    def self.validate_birth_date
      validates :birth_date, comparison: { less_than_or_equal_to: Constable::AGE_OF_ADULT,
                                           message: 'Patient must be adult' }
    end

    def self.validate_phone_number
      validates :phone_number, presence: true,
                               uniqueness: true,
                               numericality: true,
                               length: Constable::RANGE_NAME_LENGTH,
                               format: {
                                 with: Constable::REGEXP_PHONE_NUMBER,
                                 message: 'First symbol must be plus and after it only numbers'
                               }
    end
    def self.validate_password
      validates :password, presence: true,
                           length: Constable::RANGE_PASSWORD_LENGTH,
                           format: {
                             with: Constable::REGEXP_PASSWORD,
                             message: 'Only English letters, must contain at least one capital letter,
                                     1 lowercase letter and 1 number'
                           }
      validates :password_confirmation, presence: true, if: -> { password.present? }
      validates_confirmation_of :password, if: -> { password.present? }
    end

    def self.validate_work_experience
      validates :work_experience, presence: true,
                                  numericality: true
    end

    def self.uniq_name_category
      validates :name, uniqueness: true
    end

    def self.validate_date_of_visit
      validates :date_of_visit, comparison: { greater_than_or_equal_to: Date.current,
                                              message: 'The date of the visit must be today or later' }
    end
  end

  private

  def recommendation_required?
    attribute_changed?(:recommendation)
  end
end
