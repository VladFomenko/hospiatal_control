# frozen_string_literal: true

module ApplicationHelper
  include ErrorsHelper

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :success
      'success'
    when :errors, :alert
      'danger'
    when :notice, :info
      'info'
    else
      flash_type.to_s
    end
  end
end
