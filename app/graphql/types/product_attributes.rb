module Types
  class ProductAttributes < Types::BaseInputObject
    argument :name, String, required: true
    argument :price, Integer, required: true
  end
end
