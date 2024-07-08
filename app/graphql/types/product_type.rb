# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :name, String, null: false
    field :price, Integer, null: false, default_value: 0
  end
end

