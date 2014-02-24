require "cardboard_blog/engine"

module CardboardBlog
  class Railtie < ::Rails::Railtie
    
    config.after_initialize do
      # Add load paths straight to I18n, so engines and application can overwrite it.
      # require 'active_support/i18n'
      # I18n.load_path.unshift *Dir[File.expand_path('../cardboard_blog/locales/*.yml', __FILE__)]

      Cardboard.resource_controllers |= [Cardboard::BlogPostsController, Cardboard::BlogTagsController]
    end
  end
end
