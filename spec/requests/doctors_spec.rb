require 'rails_helper'

RSpec.describe 'Doctors', type: :request do
  describe 'POST /doctor' do
    it 'creates a new doctor' do
      doctor_params = FactoryBot.attributes_for(:doctor)

      post doctors_path, params: { doctor: doctor_params }

      expect(response).to have_http_status(:redirect).or have_http_status(:created)
    end
  end
end
