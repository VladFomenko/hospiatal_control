# frozen_string_literal: true

module DoctorableController
  extend ActiveSupport::Concern

  def change_category(doctor, category)
    return doctor.categories.update(category) if doctor.categories.exists?

    doctor.categories.create(category)
  end
end
