module Cardboard
  module Blog
    class Category < ActiveRecord::Base
      self.table_name = 'cardboard_blog_categories'
      has_and_belongs_to_many :posts, join_table: 'cardboard_categories_posts'
    end
  end
end