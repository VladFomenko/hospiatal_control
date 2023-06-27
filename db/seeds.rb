# frozen_string_literal: true

Visit.destroy_all
Doctor.destroy_all
Client.destroy_all
Category.destroy_all

ARR_OF_CATEGORY = %w[ Surgeon
                      Cardiologist
                      Dermatologist
                      Neurologist
                      Psychiatrist
                      Gynecologist
                      Pediatrician
                      Ophthalmologist
                      Anesthesiologist
                      Radiologist
                      Dentist
                      Urologist
                      Endocrinologist
                      Gastroenterologist
                      Oncologist
                      Nephrologist
                      Pulmonologist
                      Rheumatologist
                      ENT ].freeze

PASSWORD = 'Password123'
PHONE_NUMBER = 9_999_999

# create categories
ARR_OF_CATEGORY.each { |category| Category.create(name: category) }

# create doctors
ARR_OF_CATEGORY.each.with_index do |category, i|

  2.times do |e|
    Doctor.create(first_name: FFaker::NameBR.first_name,
                  second_name: FFaker::NameBR.last_name,
                  phone_number: "+38067#{PHONE_NUMBER - i - e * 10}",
                  password: PASSWORD,
                  work_experience: rand(24..240),
                  category: Category.find_by(name: category))
  end
end

# create users
(Doctor.count * 3).times do |i|
  Client.create(first_name: FFaker::NameBR.first_name,
                second_name: FFaker::NameBR.last_name,
                phone_number: "+38067#{PHONE_NUMBER - i}",
                password: PASSWORD,
                birth_date: Date.new(rand(1991..2005), rand(1..12), rand(1..28)))
end

# create visits
(1..Doctor.count).each do
  3.times { Visit.create(date_of_visit: Date.current + 14, doctor_id: Doctor.all.sample.id, client_id: Client.all.sample.id) }
end

