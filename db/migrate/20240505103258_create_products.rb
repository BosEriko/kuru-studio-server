class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.monetize :price
      t.string :variety, array: true, default: []
      t.string :color, array: true, default: []
      t.string :size, array: true, default: []
      t.integer :discount, default: 0, null: false
      t.string :cover_image_url
      t.uuid :tenant_id, null: false

      t.timestamps
    end
  end
end
