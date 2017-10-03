class CreateSimpleAdminDeviseMigration < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :simple_admin_users do |t|
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at

      if ActiveRecord::Base.connection.adapter_name == 'postgresql'
        t.inet :current_sign_in_ip
        t.inet :last_sign_in_ip
      else
        t.string :current_sign_in_ip
        t.string :last_sign_in_ip
      end

      t.timestamps null: false
    end
  end
end
