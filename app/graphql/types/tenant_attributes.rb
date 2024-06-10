module Types
  class TenantAttributes < Types::BaseInputObject
    argument :tenant_identifier, String, required: true
    argument :password, String, required: true
  end
end
