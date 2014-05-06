module Cardboard
  module Blog
    class Category < ActiveRecord::Base
      self.table_name = 'cardboard_blog_categories'

      has_many :posts

      validates :name, presence: true, uniqueness: {:case_sensitive => false}

      dragonfly_accessor :image

      #Hooks
      include UrlConcern
      before_validation :set_defaults

    private

      def set_defaults
        self.slug ||= name
        self.path = "/"
        self.meta_tags = meta_tags.reverse_merge("title" => name)
      end
    end
  end
end
