module Mutations
  module Inventory
    class Create < ::Mutations::BaseMutation
      argument :inventory_attributes, Types::InventoryAttributes, required: true

      field :inventory, Types::InventoryType, null: true
      field :errors, [String], null: true

      def resolve(inventory_attributes:)
        check_tenant!
        inventory = ::Inventory.new(
          name: inventory_attributes[:name],
          inventory_type: inventory_attributes[:inventory_type],
          tenant_id: context[:current_tenant].id
        )

        if inventory.save
          {
            inventory: inventory,
            errors: []
          }
        else
          {
            inventory: nil,
            errors: inventory.errors.full_messages
          }
        end
      end
    end
  end
end
