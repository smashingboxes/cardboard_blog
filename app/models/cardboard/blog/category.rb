module Cardboard
  module Blog
    class Category < ActiveRecord::Base
      self.table_name = 'cardboard_blog_categories'
      has_many :posts
    end
  end
end
