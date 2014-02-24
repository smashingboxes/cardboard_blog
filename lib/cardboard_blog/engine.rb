require 'cardboard_cms'
require 'acts-as-taggable-on'
require 'impressionist'

module CardboardBlog
  class Engine < ::Rails::Engine
    railtie_name "cardboard_blog"
  end
end
