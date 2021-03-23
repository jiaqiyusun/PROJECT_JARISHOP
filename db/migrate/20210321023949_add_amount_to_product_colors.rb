class AddAmountToProductColors < ActiveRecord::Migration[6.0]
  def change
    add_column :product_colors, :amount, :integer
  end
end
