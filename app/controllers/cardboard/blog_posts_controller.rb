require_dependency "cardboard/resource_controller"


class Cardboard::BlogPostsController < Cardboard::ResourceController
  defaults :resource_class => Cardboard::Blog::Post
  menu label: "Blog", priority: 1
  actions :all, except: [:show]

  def create
    if params[:commit][/publish/i]
      @blog_post = Cardboard::Blog::Post.new(*resource_params)
      @blog_post.published_at = DateTime.now
    end
    create!
  end

  def update
    if params[:commit][/publish/i]
      @blog_post = Cardboard::Blog::Post.find(params[:id])
      @blog_post.published_at = DateTime.now
    end
    update!
  end

end
