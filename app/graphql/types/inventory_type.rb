# frozen_string_literal: true

module Types
  class InventoryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :inventory_type, String, null: false
    field :amount, Integer, null: false
    field :amount_type, String, null: false
    field :variety, String, null: true
    field :color, String, null: true
    field :size, String, null: true
    field :cover_image_url, String, null: true
    field :other_fields, GraphQL::Types::JSON, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

