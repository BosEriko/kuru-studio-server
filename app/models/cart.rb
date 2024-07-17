class Cart < ApplicationRecord
  include ActsAsTenant

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  belongs_to :product, class_name: 'Product', foreign_key: :product_id, optional: false
  belongs_to :user, class_name: 'User', foreign_key: :user_id, optional: false
end
