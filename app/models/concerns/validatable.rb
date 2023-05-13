# frozen_string_literal: true

module Validatable
  extend ActiveSupport::Concern

  RANGE_NAME_LENGTH = 2..30
  RANGE_PASSWORD_LENGTH = 8..30
  RANGE_PHONE_NUMBER_LENGTH = 10..15

  REGEXP_NAME = /\A[A-Za-zА-Яа-яІіЇїЄє]+([- ]?[A-Za-zА-Яа-яІіЇїЄє]+)*\z/
  REGEXP_PHONE_NUMBER = /\A\+\d\z/
  REGEXP_PASSWORD = /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d]+\z/

  included do
    def self.validate_name(field = :first_name)
      validates field, presence: true,
                       length: RANGE_NAME_LENGTH,
                       format: {
                         with: REGEXP_NAME,
                         message: 'Only space or hyphen'
                       }
    end

    def self.validate_birth_date
      validates :birth_date, comparison: { greater_than_or_equal_to: Date.current }
    end

    def self.validate_phone_number
      validates :phone_number, presence: true,
                               numericality: true,
                               length: RANGE_NAME_LENGTH,
                               format: {
                                 with: REGEXP_PHONE_NUMBER,
                                 message: 'First symbol must be plus and after it only numbers'
                               }
    end

    def self.validate_password
      validates :password, presence: true,
                           length: RANGE_PASSWORD_LENGTH,
                           format: {
                             with: REGEXP_PASSWORD,
                             message: 'Only English letters, must contain at least one capital letter,
                                     1 lowercase letter and 1 number'
                           }
    end

    def self.validate_work_experience
      validates :work_experience, presence: true,
                                  numericality: true
    end
  end
end
