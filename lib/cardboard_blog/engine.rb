require 'cardboard_cms'
require 'impressionist'
require 'simple_dragonfly_preview'

module CardboardBlog
  class Engine < ::Rails::Engine
    railtie_name "cardboard_blog"
  end
end
