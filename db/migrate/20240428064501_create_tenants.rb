class CreateTenants < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants, id: :uuid do |t|
      t.string :api_key
      t.string :identifier, null: false
      t.string :password_digest
      t.text :allowed_domains, array: true, default: []
      t.text :included_features, array: true, default: []

      t.timestamps
    end

    add_index :tenants, :api_key, unique: true
    add_index :tenants, :identifier, unique: true
  end
end
