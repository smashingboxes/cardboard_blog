require "cardboard_blog/engine"

module CardboardBlog
  class Railtie < ::Rails::Railtie
    
    config.after_initialize do
      Cardboard.resource_controllers |= [Cardboard::BlogPostsController, Cardboard::BlogTagsController]
    end
  end
end
