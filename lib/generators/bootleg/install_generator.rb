require 'rails/generators/migration'

module Bootleg
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def run_generators
        generate "bootleg:movie"
        generate "bootleg:theater"
        generate "bootleg:showtime"
      end
    end
  end
end
