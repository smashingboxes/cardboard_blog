module Cardboard
  class BlogPost < ActiveRecord::Base
    has_and_belongs_to_many :categories, join_table: 'cardboard_categories_posts',  class_name: "BlogCategory"
    has_many :images, class_name: "BlogImage"
  end
end
