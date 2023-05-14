# frozen_string_literal: true

module Constable
  extend ActiveSupport::Concern

  RANGE_NAME_LENGTH = 2..30
  RANGE_PASSWORD_LENGTH = 8..30
  RANGE_PHONE_NUMBER_LENGTH = 10..15
  RANGE_RECOMMENDATION_LENGTH = 200..3000
  AGE_OF_ADULT = Date.current - 4380
  RANGE_TYPE_OF_DOCTORS = ['Family medicine doctor',
                           'Pediatrician',
                           'Cardiologist',
                           'Oncologist',
                           'Gastroenterologist',
                           'Pulmonologist',
                           'Infectious disease specialist',
                           'Neurologist',
                           'Endocrinologist',
                           'Ophthalmologist',
                           'Otolaryngologist',
                           'Dermatologist',
                           'Psychiatrist',
                           'Neurologist',
                           'Surgeon',
                           'General practitioner'].freeze

  REGEXP_NAME = /\A[A-Za-z]+([- ]?[A-Za-z]+)*\z/
  REGEXP_PHONE_NUMBER = /\A\+\d\z/
  REGEXP_PASSWORD = /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d]+\z/
end
