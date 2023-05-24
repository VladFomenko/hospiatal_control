class AddReferenceCategoryToDoctor < ActiveRecord::Migration[7.0]
  def up
    add_reference :doctors, :category, null: true, foreign_key: true
  end

  def down
    remove_reference :doctors, :category
  end
end
