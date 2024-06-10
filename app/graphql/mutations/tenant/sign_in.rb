module Mutations
  module Tenant
    class SignIn < ::Mutations::BaseMutation
      null true

      argument :credentials, Types::TenantAttributes, required: false

      field :token, String, null: true
      field :tenant, Types::TenantType, null: true

      def resolve(credentials: nil)
        return unless credentials

        tenant = ::Tenant.find_by identifier: credentials[:identifier]

        return unless tenant
        return unless tenant.authenticate(credentials[:password])

        crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
        token = crypt.encrypt_and_sign("tenant-id:#{ tenant.id }")

        { tenant: tenant, token: token }
      end
    end
  end
end
