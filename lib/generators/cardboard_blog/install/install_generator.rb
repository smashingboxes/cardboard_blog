require 'rails/generators'

module CardboardBlog
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def install_migrations
        puts "Copying over migrations..."
        Dir.chdir(Rails.root) do
          `rake cardboard:install:migrations`
          `rake cardboard_blog:install:migrations`
        end
      end

    end
  end
end
