# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :price_cents, Float, null: false
    field :price_currency, String, null: false
    field :variety, [String], null: true
    field :color, [String], null: true
    field :size, [String], null: true
    field :discount, Integer, null: false
    field :cover_image_url, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end

