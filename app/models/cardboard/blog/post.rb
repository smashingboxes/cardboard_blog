module Cardboard
  module Blog
    class Post < ActiveRecord::Base
      self.table_name = 'cardboard_blog_posts'

      belongs_to :category, class_name: "Tag"
      has_many :taggings
      has_many :tags, through: :taggings

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
      
      def tag_list
        tags.map(&:name).join(", ")
      end
      
      def tag_list=(names)
        names = names.split(",") if names.is_a?(String)
        all_tags = names.inject([]) do |array, n|
          if n.blank?
            array
          else
            array << Tag.where(name: n.strip).first_or_create! 
          end
        end
        self.tags = all_tags if all_tags
      end

      #overwritten setters/getters
      def author
        return nil unless user_id
        Cardboard.application.user_class.constantize.find(self.user_id)
      end

      def author_name
        self.author.try(:name) || user_name || self.author.try(:email)
      end

      def to_params
        "#{id}-#{slug}"
      end

    private

      def set_defaults
        self.slug ||= title
        self.path = "/"
        self.meta_tags = meta_tags.reverse_merge("title" => title)
      end
    end
  end
end
