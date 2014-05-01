module Cardboard
  module Blog
    class Post < ActiveRecord::Base
      self.table_name = 'cardboard_blog_posts'

      belongs_to :category, class_name: "Tag"
      has_many :taggings
      has_many :tags, through: :taggings

      scope :draft, ->{where("published_at IS NULL")}
      scope :published, ->{where("published_at IS NOT NULL")}

      include UrlConcern

      # Gem initialization
      is_impressionable counter_cache: true, :column_name => :visits, :unique => :request_hash
      dragonfly_accessor :image

      # Validations
      validates :title, :category, presence: true

      #Hooks
      before_validation :set_defaults
      
      #tag concern
     def self.tagged_with(name)
        Tag.find_by!(name: name).articles
      end

      def self.tag_counts
        Tag.select("tags.*, count(taggings.tag_id) as count").
            joins(:taggings).
            group("taggings.tag_id")
      end

      #overwritten setters/getters
      def author
        return nil unless user_id
        Cardboard.application.user_class.constantize.find(self.user_id)
      end

      def author_name
        self.author.try(:name) || user_name || self.author.try(:email)
      end

      def published?
        return false unless published_at
        published_at <= DateTime.now
      end

      def draft?
        !published?
      end

      def to_params
        "#{id}-#{slug}"
      end

    private

      def set_defaults
        self.slug ||= title
        self.path = "/"
        self.meta_tags = meta_tags.reverse_merge("title" => title, "description" => summary)
      end
    end
  end
end
