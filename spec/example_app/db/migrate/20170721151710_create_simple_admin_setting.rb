class CreateSimpleAdminSetting < ActiveRecord::Migration
  def change
    create_table :simple_admin_settings do |t|
      t.string :name
      t.string :value
      t.string :presentation

      t.integer :sort_order

      t.timestamps null: false
    end
  end
end
