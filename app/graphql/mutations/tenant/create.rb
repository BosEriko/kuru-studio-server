module Mutations
  module Tenant
    class Create < ::Mutations::BaseMutation
      class TenantProviderSignupData < Types::BaseInputObject
        argument :credentials, Types::TenantAttributes, required: false
      end

      argument :tenant_provider, TenantProviderSignupData, required: false

      type Types::TenantType

      def resolve(tenant_provider: nil)
        Tenant.create!(
          email: tenant_provider&.[](:credentials)&.[](:tenant_identifier),
          password: tenant_provider&.[](:credentials)&.[](:password)
        )
      end
    end
  end
end
