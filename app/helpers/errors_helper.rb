# frozen_string_literal: true

module ErrorsHelper
  def error_attributes(resource)
    resource.errors.map(&:attribute).uniq
  end

  def password_confirmation_error(resource)
    if error_attributes(resource).include?(:password_confirmation)
      content_tag(:div, 'Passwords do not match', class: 'alert alert-danger', role: 'alert')
    end
  end
end
