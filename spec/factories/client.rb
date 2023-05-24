# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    first_name { FFaker::Name.first_name }
    second_name { FFaker::Name.last_name }
    birth_date { Date.new(rand(1965..2000), rand(1..12), rand(1..28)) }
    phone_number { FFaker::PhoneNumberUA.international_mobile_phone_number }
    password { Devise.friendly_token[0, 20] }
  end
end
