module Types
  class InventoryOtherFieldAttributes < Types::BaseInputObject
    argument :icon, String, required: true
    argument :key, String, required: true
    argument :value, String, required: true
  end

  class InventoryAttributes < Types::BaseInputObject
    argument :name, String, required: true
    argument :inventory_type, String, required: true
    argument :amount, Integer, required: true
    argument :amount_type, String, required: true
    argument :variety, String, required: false
    argument :color, String, required: false
    argument :size, String, required: false
    argument :cover_image_url, String, required: false
    argument :other_fields, [Types::InventoryOtherFieldAttributes], required: false
  end
end
