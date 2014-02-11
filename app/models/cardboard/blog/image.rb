module Cardboard
  module Blog
    class Image < ActiveRecord::Base
      self.table_name = 'cardboard_blog_images'
      belongs_to :post
    end
  end
end
