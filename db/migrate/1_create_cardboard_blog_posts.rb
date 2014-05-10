class CreateCardboardBlogPosts < ActiveRecord::Migration
  def change
    # Posts
    create_table :cardboard_blog_posts do |t|
      t.string :title
      t.text :summary
      t.text :body
      t.integer :visits, :default => 0
      t.datetime :published_at
      t.integer :user_id, index: true
      t.string :author_name
      t.integer :category_id, index: true
      t.string :image_uid
      t.timestamps
    end

    # Tags
    create_table :cardboard_blog_tags do |t|
      t.string :name
      t.string :image_uid
    end

    create_table :cardboard_blog_taggings do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :post, index: true
    end

    # Categories
    create_table :cardboard_blog_categories do |t|
      t.string :name
      t.string :image_uid
    end
  end
end
