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
end
