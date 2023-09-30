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
                               numericality: true,
                               length: Constable::RANGE_NAME_LENGTH,
                               format: {
                                 with: Constable::REGEXP_PHONE_NUMBER,
                                 message: 'First symbol must be plus and after it only numbers'
                               },
                               uniqueness: { message: 'Phone number is already insulated' }
    end

    def self.validate_password
      validates :password, presence: true,
                           length: Constable::RANGE_PASSWORD_LENGTH,
                           format: {
                             with: Constable::REGEXP_PASSWORD,
                             message: 'Only English letters, must contain at least one capital letter,
                                     1 lowercase letter and 1 number'
                           }, unless: Proc.new { |a| a.password.blank? }
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

    # TODO: need to test
    def phone_number_exist
      user = user_definition.find_by(phone_number: phone_number)

      return if user

      errors.add(:phone_number, 'User with this phone number does not exist')
    end

    # TODO: need to test
    def password_exist
      user = resource_class.find_by(phone_number: resource.phone_number)
      return unless user

      return if user.valid_password?(resource.password)

      errors.add(:password, 'Invalid password')
    end
  end

  private

  def user_definition
    user_models = { Doctor: Doctor, Client: Client }

    user_models[self.class]
  end

  def recommendation_required?
    attribute_changed?(:recommendation)
  end
end
