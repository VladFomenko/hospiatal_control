# frozen_string_literal: true

class AddDeviseToClients < ActiveRecord::Migration[7.0]
  def up
    change_table :clients do |t|
      ## Database authenticatable
      t.string :phone_number, null: false
      t.string :encrypted_password, null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
    end

    add_index :clients, :phone_number, unique: true
    add_index :clients, :reset_password_token, unique: true
  end

  def down
    remove_index :clients, :phone_number
    remove_index :clients, :reset_password_token
    remove_column :clients, :phone_number
    remove_column :clients, :encrypted_password
    remove_column :clients, :reset_password_token
    remove_column :clients, :reset_password_sent_at
    remove_column :clients, :remember_created_at
  end
end
