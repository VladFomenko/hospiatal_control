# frozen_string_literal: true

class AddColumnToCategory < ActiveRecord::Migration[7.0]
  def up
    add_column :categories, :doctors_count, :integer, default: 0
  end

  def down
    remove_column :categories, :doctors_count
  end
end
