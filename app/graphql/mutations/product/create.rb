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
          price_cents: product_attributes[:price_cents],
          price_currency: product_attributes[:price_currency],
          variety: product_attributes[:variety],
          color: product_attributes[:color],
          size: product_attributes[:size],
          discount: product_attributes[:discount],
          cover_image_url: product_attributes[:cover_image_url],
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
