class CreateProductColors < ActiveRecord::Migration[6.0]
  def change
    create_table :product_colors do |t|
      t.references :product
      t.references :color, null: false, foreign_key: true

      t.timestamps
    end
  end
end
