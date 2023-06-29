# frozen_string_literal: true

module ErrorsHelper
  def error_attributes(resource)
    resource.errors.map(&:attribute).uniq
  end
end
