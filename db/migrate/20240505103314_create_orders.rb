class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.string :status_type, null: false, default: "order_placed"
      t.uuid :user_id, null: false
      t.uuid :tenant_id, null: false

      t.timestamps
    end
  end
end
