# frozen_string_literal: true

module Types
  class InventoryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :inventory_type, String, null: false
  end
end

