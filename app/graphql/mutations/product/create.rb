module Mutations
  module Product
    class Create < ::Mutations::BaseMutation
      argument :product_attributes, Types::ProductAttributes, required: true

      field :product, Types::ProductType, null: true
      field :errors, [String], null: true

      def resolve(product_attributes:)
        check_tenant!
        product = ::Product.new(
          name: product_attributes[:name],
          price: product_attributes[:price],
          tenant_id: context[:current_tenant].id
        )

        if product.save
          {
            product: product,
            errors: []
          }
        else
          {
            product: nil,
            errors: product.errors.full_messages
          }
        end
      end
    end
  end
end
