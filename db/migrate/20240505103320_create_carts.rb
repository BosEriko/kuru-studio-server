class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts, id: :uuid do |t|
      t.integer :quantity, null: false, default: 1
      t.string :variety
      t.uuid :user_id, null: false
      t.uuid :product_id, null: false
      t.uuid :tenant_id, null: false

      t.timestamps
    end
  end
end
