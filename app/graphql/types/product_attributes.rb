module Types
  class ProductAttributes < Types::BaseInputObject
    argument :name, String, required: true
    argument :price_cents, Float, required: true
    argument :price_currency, String, required: false
    argument :variety, [String], required: false
    argument :color, [String], required: false
    argument :size, [String], required: false
    argument :discount, Integer, required: false
    argument :cover_image_url, String, required: false
  end
end
