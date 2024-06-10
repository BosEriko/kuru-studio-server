module Types
  class TenantAttributes < Types::BaseInputObject
    argument :identifier, String, required: true
    argument :password, String, required: true
  end
end
