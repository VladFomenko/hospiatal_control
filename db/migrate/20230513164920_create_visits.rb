# frozen_string_literal: true

class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.datetime :date_of_visit, null: false
      t.integer :status, null: false, default: 0
      t.text :recommendation
      t.references :doctor, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :visits
  end
end
