class Order < ApplicationRecord
  include ActsAsTenant

  has_many :purchases, dependent: :destroy
  has_many :products, through: :purchases

  enum status_type: {
    order_placed: "order_placed",
    payment_info_confirmed: "payment_info_confirmed",
    order_shipped_out: "order_shipped_out",
    order_received: "order_received",
    to_rate: "to_rate",
  }

  belongs_to :user, class_name: 'User', foreign_key: :user_id, optional: false
end
