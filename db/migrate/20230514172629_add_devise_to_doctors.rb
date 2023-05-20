# frozen_string_literal: true

class AddDeviseToDoctors < ActiveRecord::Migration[7.0]
  def up
    change_table :doctors do |t|
      ## Database authenticatable
      t.string :phone_number, null: false
      t.string :encrypted_password, null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
    end

    add_index :doctors, :phone_number, unique: true
    add_index :doctors, :reset_password_token, unique: true
  end

  def down
    remove_index :doctors, :phone_number
    remove_index :doctors, :reset_password_token
    remove_column :doctors, :encrypted_password
    remove_column :doctors, :reset_password_token
    remove_column :doctors, :reset_password_sent_at
    remove_column :doctors, :remember_created_at
  end
end
