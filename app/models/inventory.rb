class Inventory < ApplicationRecord
  include ActsAsTenant

  enum inventory_type: {
    material: "material",
    product: "product",
  }

  enum amount_type: {
    quantity: "quantity",
    length: "length",
    volume: "volume",
    weight: "weight",
    area: "area",
  }, _prefix: :amount

  validates :cover_image_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: 'must be a valid URL' }, allow_blank: true
  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :materials
  has_many :products, through: :materials
end
