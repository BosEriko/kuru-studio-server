class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases, id: :uuid do |t|
      t.monetize :price
      t.integer :quantity, null: false, default: 1
      t.uuid :order_id, null: false
      t.uuid :user_id, null: false
      t.uuid :product_id, null: false
      t.uuid :tenant_id, null: false

      t.timestamps
    end
  end
end
