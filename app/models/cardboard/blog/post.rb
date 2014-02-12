module Cardboard
  module Blog
    class Post < ActiveRecord::Base
      self.table_name = 'cardboard_blog_posts'
      has_and_belongs_to_many :categories, join_table: 'cardboard_categories_posts'
      
      dragonfly_accessor :image

      validates :title, presence: true

    end
  end
end
