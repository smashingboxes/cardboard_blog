class BlogController < ApplicationController

  def router
    if current_page.using_slug_backup?
      redirect_to current_page.url, status: :moved_permanently
    else
      # call controller hook
      @template_path = current_page.class.name.underscore.split("/")
      
      method = @template_path.last
      self.send(method) if self.respond_to? method    
      @template_path = @template_path[1..-1].join("/")

      respond_to do |format|
        format.html {render "cardboard/pages/show", layout: @layout || "layouts/application"}
        format.js {render "templates/#{@template_path}"}
      end
      
    end
  end

private

  def current_page
    return @cardboard_page unless @cardboard_page.nil?
    
    @cardboard_page = Cardboard::Url.urlable_for(params[:id]) 
  end
end
