# frozen_string_literal: true

class AddColumnToDoctor < ActiveRecord::Migration[7.0]
  def up
    add_column :doctors, :visits_count, :integer, default: 0
  end

  def down
    remove_column :doctors, :visits_count
  end
end
