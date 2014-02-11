require_dependency "cardboard/resource_controller"


class Cardboard::BlogPostsController < Cardboard::ResourceController
  defaults :resource_class => Cardboard::Blog::Post
  menu label: "Blog", priority: 1



end
