# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[7.0]
  def up
    create_table :clients do |t|
      t.string :first_name
      t.string :second_name
      t.datetime :birth_date
      t.string :phone_number
      t.string :password

      t.timestamps
    end
  end

  def down
    drop_table :clients
  end
end
