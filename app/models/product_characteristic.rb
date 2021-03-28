class ProductCharacteristic < ApplicationRecord
  belongs_to :product
  belongs_to :color
  belongs_to :size
end
