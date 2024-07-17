class Product < ApplicationRecord
  include ActsAsTenant
  monetize :price_cents
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :name, presence: true
  validates :cover_image_url, url: true

  has_many :materials, dependent: :destroy
  has_many :inventories, through: :materials

  def stock
    materials.map do |material|
      material.inventory.quantity / material.required_quantity
    end.min
  end
end
