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
          amount: inventory_attributes[:amount],
          amount_type: inventory_attributes[:amount_type],
          variety: inventory_attributes[:variety],
          color: inventory_attributes[:color],
          size: inventory_attributes[:size],
          cover_image_url: inventory_attributes[:cover_image_url],
          other_fields: inventory_attributes[:other_fields],
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
