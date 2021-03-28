class AddCategoryToSize < ActiveRecord::Migration[6.0]
  def change
    add_reference :sizes, :category, null: false, foreign_key: true
  end
end
