module Cardboard
  module Blog
    class Tag < ActiveRecord::Base
      self.table_name = 'cardboard_blog_tags'
      validates :name, presence: true, uniqueness: {:case_sensitive => false}
    end
  end
end