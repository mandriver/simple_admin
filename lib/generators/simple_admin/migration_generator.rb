require 'rails/generators/active_record'

module SimpleAdmin
  module Generators
    class MigrationGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      argument :name, default: 'simple_admin'

      def copy_simple_admin_migration
        migration_template 'migrations/devise_migration.rb', 'db/migrate/create_simple_admin_devise_migration.rb',
                           migration_version: migration_version
        migration_template 'migrations/core_migrations/profiles_migration.rb', 'db/migrate/create_simple_admin_profiles.rb',
                           migration_version: migration_version

        migration_template 'migrations/rolify_migration.rb', 'db/migrate/create_simple_admin_rolify_migration.rb',
                           migration_version: migration_version
        migration_template 'migrations/core_migrations/user_permissions_migration.rb',
                           'db/migrate/create_simple_admin_user_permissions.rb', migration_version: migration_version

        migration_template 'migrations/core_migrations/entities_migration.rb', 'db/migrate/create_simple_admin_entities.rb',
                           migration_version: migration_version

        migration_template 'migrations/core_migrations/entity_fields_migration.rb',
                           'db/migrate/create_simple_admin_entity_fields.rb', migration_version: migration_version
        migration_template 'migrations/core_migrations/entity_field_types_migration.rb',
                           'db/migrate/create_simple_admin_entity_field_types.rb', migration_version: migration_version
        migration_template 'migrations/core_migrations/entity_field_settings_migration.rb',
                           'db/migrate/create_simple_admin_entity_field_settings.rb', migration_version: migration_version

        migration_template 'migrations/core_migrations/settings_migration.rb', 'db/migrate/create_simple_admin_settings.rb',
                           migration_version: migration_version

        migration_template 'migrations/core_data_migration.rb', 'db/migrate/create_simple_admin_core_data_migration.rb',
                           migration_version: migration_version
      end

      private

        def rails5?
          Rails.version.start_with? '5'
        end

        def migration_version
          "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" if rails5?
        end
    end
  end
end
