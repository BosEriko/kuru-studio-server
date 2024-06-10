module Mutations
  module Tenant
    class Create < ::Mutations::BaseMutation
      class TenantProviderSignupData < Types::BaseInputObject
        argument :credentials, Types::TenantAttributes, required: false
      end

      argument :tenant_provider, TenantProviderSignupData, required: false

      field :tenant, Types::TenantType, null: true
      field :errors, [String], null: true

      def resolve(tenant_provider: nil)
        tenant = ::Tenant.new(
          tenant_identifier: tenant_provider&.[](:credentials)&.[](:tenant_identifier),
          password: tenant_provider&.[](:credentials)&.[](:password)
        )

        if tenant.save
          {
            tenant: tenant,
            errors: []
          }
        else
          {
            tenant: nil,
            errors: tenant.errors.full_messages
          }
        end
      end
    end
  end
end
