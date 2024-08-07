class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials, id: :uuid do |t|
      t.uuid :product_id, null: false
      t.uuid :inventory_id, null: false
      t.integer :required_quantity, null: false, default: 1
      t.string :variety, array: true, default: []
      t.string :color, array: true, default: []
      t.string :size, array: true, default: []
      t.uuid :tenant_id, null: false

      t.timestamps
    end
  end
end
