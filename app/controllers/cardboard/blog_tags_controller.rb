require_dependency "cardboard/resource_controller"


class Cardboard::BlogTagsController < Cardboard::ResourceController
  defaults :resource_class => Cardboard::Blog::Tag
  menu false
  actions :all, except: [:show]

  # respond_to :js, :html
end
