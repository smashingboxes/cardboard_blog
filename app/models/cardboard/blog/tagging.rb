module Cardboard
  module Blog
    class Tagging < ActiveRecord::Base
      self.table_name = 'cardboard_blog_taggings'
      belongs_to :tag
      belongs_to :article
    end
  end
end
