class Inventory < ApplicationRecord
  include ActsAsTenant

  enum inventory_type: {
    material: "material",
    product: "product",
  }

  enum amount_type: {
    quantity: "quantity",
    length: "length",
    volume: "volume",
    weight: "weight",
    area: "area",
  }

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
