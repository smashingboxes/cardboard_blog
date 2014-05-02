class BlogController < ApplicationController

  def router
    if current_page.using_slug_backup?
      redirect_to current_page.url, status: :moved_permanently
    else
      # call controller hook
      @template_path = "blog/post"
      
      method = @template_path.split("/").last
      self.send(method) if self.respond_to? method    

      render "cardboard/pages/show", layout: @layout || "layouts/application"
    end
  end

private

  def current_page
    return @cardboard_page unless @cardboard_page.nil?
    
    @cardboard_page = Cardboard::Url.urlable_for(params[:id]) 
    raise(ActionController::RoutingError.new("Page not found")) if @cardboard_page.draft?
    @cardboard_page
  end
end
