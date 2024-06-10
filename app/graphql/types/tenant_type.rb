# frozen_string_literal: true

module Types
  class TenantType < Types::BaseObject
    field :id, ID, null: false
    field :tenant_identifier, String, null: false
  end
end
