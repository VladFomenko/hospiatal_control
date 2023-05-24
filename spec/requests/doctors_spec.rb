require 'rails_helper'

RSpec.describe 'Doctors', type: :request do
  # describe 'GET /doctors' do
  #   it 'works! (now write some real specs)' do
  #     doctor1 = Doctor.create(first_name: FFaker::Name.first_name,
  #                             second_name: FFaker::Name.last_name,
  #                             work_experience: FFaker::Number.number,
  #                             phone_number: FFaker::PhoneNumberUA.international_mobile_phone_number,
  #                             password: Devise.friendly_token[0, 20])
  #
  #     doctor2 = Doctor.create(first_name: FFaker::Name.first_name,
  #                             second_name: FFaker::Name.last_name,
  #                             work_experience: FFaker::Number.number,
  #                             phone_number: FFaker::PhoneNumberUA.international_mobile_phone_number,
  #                             password: Devise.friendly_token[0, 20])
  #
  #     get doctors_path
  #
  #     expect(response).to have_http_status(200)
  #     expect(response.body).to include(doctor1.first_name)
  #     expect(response.body).to include(doctor2.first_name)
  #   end
  # end

  describe 'POST /doctor' do
    it 'creates a new doctor' do
      doctor_params = { first_name: FFaker::Name.first_name,
                        second_name: FFaker::Name.last_name,
                        work_experience: FFaker::Number.number,
                        phone_number: FFaker::PhoneNumberUA.international_mobile_phone_number,
                        password: Devise.friendly_token[0, 20] }

      post doctors_path, params: { doctor: doctor_params }

      expect(response).to have_http_status(:redirect).or have_http_status(:created)
    end
  end
end
