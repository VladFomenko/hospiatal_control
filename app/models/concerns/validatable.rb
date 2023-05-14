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
      validates :birth_date, comparison: { less_than_or_equal_to: Constable::AGE_OF_ADULT }
    end

    def self.validate_phone_number
      validates :phone_number, presence: true,
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
    end

    def self.validate_work_experience
      validates :work_experience, presence: true,
                                  numericality: true
    end

    def self.validate_recommendation
      validates :recommendation,
                format: { with: Constable::RANGE_RECOMMENDATION_LENGTH,
                          message: 'Your recommendation must have to 200..3000 symbol' }
    end
  end
end
