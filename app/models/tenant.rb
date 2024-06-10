class Tenant < ApplicationRecord
  has_secure_password

  validates :api_key, uniqueness: true
  validates :identifier, presence: true, uniqueness: true

  has_many :users, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :inventories, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy

  %w(blog social tracker shop group forum block).each do |feature|
    define_method("is_#{feature}_enabled?") do
      included_features.include?(feature)
    end

    define_method("toggle_#{feature}_status!") do
      if send("is_#{feature}_enabled?")
        included_features.delete(feature)
      else
        included_features << feature
      end
      save
    end
  end

  before_validation :generate_api_key, on: :create

  private

    def generate_api_key
      self.api_key ||= SecureRandom.hex(20)
    end
end
