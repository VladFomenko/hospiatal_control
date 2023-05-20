# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :first_name, null: false
      t.string :second_name, null: false
      t.integer :work_experience

      t.timestamps
    end
  end

  def down
    drop_table :doctors
  end
end
