class Product < ApplicationRecord
  include ActsAsTenant
  monetize :price_cents
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :name, presence: true
  validates :cover_image_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: 'must be a valid URL' }, allow_blank: true

  has_many :materials, dependent: :destroy
  has_many :inventories, through: :materials

  has_many :carts, dependent: :destroy
  has_many :users, through: :carts

  has_many :purchases, dependent: :destroy
  has_many :orders, through: :purchases

  def stock
    materials.map do |material|
      material.inventory.quantity / material.required_quantity
    end.min
  end
end
