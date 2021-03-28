class CreateProductCharacteristics < ActiveRecord::Migration[6.0]
  def change
    create_table :product_characteristics do |t|
      t.references :product, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
