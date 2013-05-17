module Cardboard
  class Image < ActiveRecord::Base
    self.table_name = 'cardboard_blog_images'
    belongs_to :post
    attr_accessible :caption, :file_name, :file_uid
  end
end
