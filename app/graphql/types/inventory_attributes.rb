module Types
  class InventoryAttributes < Types::BaseInputObject
    argument :name, String, required: true
    argument :inventory_type, String, required: true
  end
end
