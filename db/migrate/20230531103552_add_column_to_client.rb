# frozen_string_literal: true

class AddColumnToClient < ActiveRecord::Migration[7.0]
  def up
    add_column :clients, :visits_count, :integer, default: 0
  end

  def down
    remove_column :clients, :visits_count
  end
end
