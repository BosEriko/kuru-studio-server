class Product < ApplicationRecord
  include ActsAsTenant
  monetize :price_cents
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :name, presence: true
  validates :cover_image_url, url: true
end
