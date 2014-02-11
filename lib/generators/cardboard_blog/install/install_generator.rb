require 'rails/generators'
require 'rails/generators/migration'

module CardboardBlog
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc 'Generates the necessary migrations'

      # def self.source_root
      #   @_cardboard_blog_source_root ||= File.expand_path("../templates", __FILE__)
      # end

      source_root File.expand_path("../templates", __FILE__)

      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      def create_migrations
        p 'Copying over migrations...'
        Dir["#{self.class.source_root}/migrations/*.rb"].sort.each do |filepath|
          name = File.basename(filepath)
          self.migration_template "migrations/#{name}", "db/migrate/#{name.gsub(/^\d+_/,'')}"
        end
      end
    end
  end
end
