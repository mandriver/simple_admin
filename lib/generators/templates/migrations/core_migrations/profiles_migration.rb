class CreateSimpleAdminProfiles < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :simple_admin_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar

      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
