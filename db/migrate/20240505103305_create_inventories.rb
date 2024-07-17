class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories, id: :uuid do |t|
      t.string :name, null: false
      t.string :inventory_type, null: false
      t.integer :amount, null: false, default: 0
      t.string :amount_type, null: false
      t.uuid :tenant_id, null: false

      t.timestamps
    end
  end
end
