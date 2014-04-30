Cardboard::Engine.routes.draw do
end

Rails.application.routes.named_routes.module.module_eval do
  def blog_post_path(identifier, options = {})
    url = identifier.try(:url)
    options.present? && url ? "#{url}?#{options.to_query}" : url
  end

  def blog_post_url(identifier, options = {})
    return nil unless url = blog_post_path(identifier, options)
    root_url + url[1..-1]
  end

  def blog_tag_path(identifier, options = {})
    url = identifier.try(:slug)
    options.present? && url ? "#{url}?#{options.to_query}" : url
  end

  def blog_tag_url(identifier, options = {})
    return nil unless url = blog_tag_path(identifier, options)
    root_url + url[1..-1]
  end
end