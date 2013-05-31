module Cardboard
  class Post < ActiveRecord::Base
    self.table_name = 'cardboard_blog_posts'
    has_and_belongs_to_many :categories, join_table: 'cardboard_categories_posts'
    has_many :images
    attr_accessible :body, :published_at, :summary, :title, :user_id, :visits
  end
end
