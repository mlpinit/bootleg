require 'rails/generators/migration'

module Bootleg
  module Generators
    class TheaterGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def generate_theater_migration
        migration_template "theater_migration.rb", "db/migrate/create_bootleg_theaters.rb"
      end

      def generate_theater_model
        copy_file "theater_model.rb", "app/models/bootleg_theater.rb"
      end

      def self.next_migration_number(path)
        @migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i.to_s
      end
    end
  end
end

