require 'rails/generators/migration'

module Bootleg
  module Generators
    class MovieGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def generate_movie_migration
        migration_template "movie_migration.rb", "db/migrate/create_bootleg_movies.rb"
      end

      def generate_movie_model
        copy_file "movie_model.rb", "app/models/bootleg_movie.rb"
      end

      def self.next_migration_number(path)
        @migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i.to_s
      end
    end
  end
end

