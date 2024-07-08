module Mutations
  module Product
    class Create < ::Mutations::BaseMutation
      argument :product_attributes, Types::ProductAttributes, required: true

      field :post, Types::ProductType, null: true
      field :errors, [String], null: true

      def resolve(post_attributes:)
        check_tenant!
        product = ::Product.new(
          name: post_attributes[:name],
          price: post_attributes[:name],
          tenant_id: context[:current_tenant].id
        )

        if post.save
          {
            post: post,
            errors: []
          }
        else
          {
            post: nil,
            errors: post.errors.full_messages
          }
        end
      end
    end
  end
end
