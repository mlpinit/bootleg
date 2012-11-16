require 'rails/generators/migration'

module Bootleg
  module Generators
    class ShowtimeGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def generate_theater_movie_migration
        migration_template "showtime_migration.rb", "db/migrate/create_bootleg_showtimes.rb"
      end

      def generate_theater_movie_model
        copy_file "showtime_model.rb", "app/models/bootleg_showtime.rb"
      end

      def self.next_migration_number(path)
        @migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i.to_s
      end
    end
  end
end

