class CreateSimpleAdminEntities < ActiveRecord::Migration
  def change
    create_table :simple_admin_entities do |t|
      t.string :model_klass_name
      t.string :model_plural_name
      t.string :label

      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
