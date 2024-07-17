class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :name, null: false
      t.string :contact_number
      t.string :region
      t.string :provice
      t.string :city
      t.string :barangay
      t.string :postal_code
      t.string :address
      t.boolean :is_default, default: false, null: false
      t.uuid :user_id, null: false
      t.uuid :tenant_id, null: false

      t.timestamps
    end
  end
end
