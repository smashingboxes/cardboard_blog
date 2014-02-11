module Cardboard
  class BlogCategory < ActiveRecord::Base
    has_and_belongs_to_many :posts, join_table: 'cardboard_categories_posts', class_name: "BlogPost"
  end
end
