# frozen_string_literal: true

FactoryBot.define do
  factory :visit do
    date_of_visit { Date.new + rand(1..28) }

    association :doctor, factory: :doctor
    association :client, factory: :client
  end
end
