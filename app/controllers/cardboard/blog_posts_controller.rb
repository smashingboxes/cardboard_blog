require_dependency "cardboard/resource_controller"


class Cardboard::BlogPostsController < Cardboard::ResourceController
  defaults :resource_class => Cardboard::Blog::Post
  menu label: "Blog", priority: 1
  actions :all, except: [:show]

  def create
    if params[:commit][/publish/i]
      @blog_post = Cardboard::Blog::Post.new(*resource_params)
      update_published_at
    end
    create!
  end

  def update
    if params[:commit][/publish/i]
      @blog_post = Cardboard::Blog::Post.find(params[:id])
      update_published_at
    end
    update!
  end

  private

  def update_published_at
    if params[:commit][/unpublish/i]
      @blog_post.published_at = nil
    else
      @blog_post.published_at = DateTime.now
    end
  end
end
