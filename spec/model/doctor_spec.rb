require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it 'is valid with a valid phone number' do
    doctor = FactoryBot.build(:doctor)
    expect(doctor).to be_valid
  end

  it 'is invalid with an invalid phone number' do
    doctor = Doctor.new(first_name: FFaker::NameUA.first_name,
                        second_name: FFaker::NameUA.last_name,
                        phone_number: '12345')
    expect(doctor).not_to be_valid
  end
end
