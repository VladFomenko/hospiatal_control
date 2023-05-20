# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[7.0]
  def up
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :second_name, null: false
      t.datetime :birth_date, null: false

      t.timestamps
    end
  end

  def down
    drop_table :clients
  end
end
