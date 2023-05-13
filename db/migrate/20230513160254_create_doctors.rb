# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :second_name
      t.string :password
      t.integer :work_experience

      t.timestamps
    end
  end

  def down
    drop_table :doctors
  end
end
