# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    first_name { FFaker::Name.first_name }
    second_name { FFaker::Name.last_name }
    work_experience { rand(10..480) }
    phone_number { FFaker::PhoneNumberUA.international_mobile_phone_number }
    password { Devise.friendly_token[0, 20] }
  end
end
