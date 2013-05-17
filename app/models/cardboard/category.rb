module Cardboard
  class Category < ActiveRecord::Base
    self.table_name = 'cardboard_blog_categories'
    has_and_belongs_to_many :posts
    attr_accessible :name
  end
end
