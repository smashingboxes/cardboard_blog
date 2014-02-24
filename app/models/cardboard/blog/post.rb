module Cardboard
  module Blog
    class Post < ActiveRecord::Base
      self.table_name = 'cardboard_blog_posts'

      belongs_to :category
      
      # Gem initialization
      acts_as_taggable
      is_impressionable :counter_cache => true, :column_name => :visits, :unique => :request_hash
      dragonfly_accessor :image

      # Validations
      validates :title, presence: true

      def author
        return nil unless user_id
        Cardboard.application.user_class.constantize.find(self.user_id)
      end

      def author_name
        self.author.try(:name) || self.author.try(:email) 
      end
    end
  end
end
