# frozen_string_literal: true

client = Client.create!(first_name: 'John', second_name: 'Doe', phone_number: '+380677777777', password: 'Password123',
                        birth_date: Date.new(rand(1991..2005), rand(1..12), rand(1..28)))
doctor = Doctor.create!(first_name: 'Albert', second_name: 'Cody', password: 'Password123', work_experience: 23)
doctor.categories.create(name: 'Pediatrician')
client.visits.create(date_of_visit: Date.current + 14, doctor_id: doctor.id)
