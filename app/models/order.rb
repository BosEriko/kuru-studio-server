class Order < ApplicationRecord
  include ActsAsTenant

  has_many :purchases, dependent: :destroy
  has_many :products, through: :purchases

  belongs_to :user, class_name: 'User', foreign_key: :user_id, optional: false
end
