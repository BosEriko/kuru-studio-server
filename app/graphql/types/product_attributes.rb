module Types
  class ProductAttributes < Types::BaseInputObject
    argument :name, String, required: false
    argument :price_cents, Integer, required: false, default_value: 0
    argument :price_currency, String, required: false, default_value: "PHP"
  end
end
