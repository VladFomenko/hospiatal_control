# frozen_string_literal: true

RSpec.describe 'Updating a visit', type: :feature do
  before do
    @doctor = FactoryBot.create(:doctor)

    login_doctor
  end

  it 'updates a visit with a patient and recommendation' do
    @client = FactoryBot.create(:client)

    @visit = FactoryBot.create(:visit, doctor: @doctor, client: @client)

    visit edit_doctor_visit_path(@doctor, @visit)

    fill_in 'visit[recommendation]', with: 'Very long and useful recommendation'

    click_button 'Update Visit'

    expect(page).to have_content('Update was successful')
  end

  def login_doctor
    visit new_doctor_session_path

    fill_in 'Phone number', with: @doctor.phone_number
    fill_in 'Password', with: @doctor.password

    click_button 'Log in'
  end
end
