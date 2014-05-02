require 'cardboard_cms'
require 'impressionist'
require 'simple_dragonfly_preview'
require 'cardboard_blog/constraints/blog_constraint'

module CardboardBlog
  class Engine < ::Rails::Engine
    railtie_name "cardboard_blog"
  end
end
