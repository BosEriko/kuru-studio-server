class CreateFirebases < ActiveRecord::Migration[7.0]
  def change
    create_table :firebases, id: :uuid do |t|
      t.uuid :tenant_id, null: false
      t.string :api_key
      t.string :auth_domain
      t.string :database_url
      t.string :project_id
      t.string :storage_bucket
      t.string :messaging_sender_id
      t.string :app_id
      t.string :measurement_id

      t.timestamps
    end
  end
end
