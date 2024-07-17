class User < ApplicationRecord
  include ActsAsTenant
  has_paper_trail

  validates :email, presence: true, uniqueness: { scope: :tenant_id }

  has_many :purchases, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_many :carts, dependent: :destroy
  has_many :products, through: :carts
end
