module Cardboard
  module Blog
    class Tagging < ActiveRecord::Base
      self.table_name = 'cardboard_blog_taggings'
      belongs_to :tag
      belongs_to :post
    end
  end
end
