class Material < ApplicationRecord
  belongs_to :product, class_name: 'Product', foreign_key: :product_id, optional: false
  belongs_to :inventory, class_name: 'Inventory', foreign_key: :inventory_id, optional: false
  validates :required_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
