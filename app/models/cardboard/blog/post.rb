module Cardboard
  module Blog
    class Post < ActiveRecord::Base
      self.table_name = 'cardboard_blog_posts'

      belongs_to :category

      # Gem initialization
      acts_as_taggable
      is_impressionable :counter_cache => true, :column_name => :visits, :unique => :request_hash
      dragonfly_accessor :image
      acts_as_url :title, :url_attribute => :slug, only_when_blank: true

      # Validations
      validates :title, presence: true

      #overwritten setters/getters
      def slug=(value)
        # the user can overwrite the auto generated slug
        self[:slug] = value.present? ? value.to_url : nil
      end

      def author
        return nil unless user_id
        Cardboard.application.user_class.constantize.find(self.user_id)
      end

      def author_name
        self.author.try(:name) || self.author.try(:email) 
      end

      def to_params
        "#{id}-#{slug}"
      end
    end
  end
end
