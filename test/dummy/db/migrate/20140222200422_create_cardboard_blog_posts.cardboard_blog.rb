# This migration comes from cardboard_blog (originally 1)
class CreateCardboardBlogPosts < ActiveRecord::Migration
  def change
    # Posts
    create_table :cardboard_blog_posts do |t|
      t.string :title
      t.text :summary
      t.text :body
      t.integer :visits
      t.datetime :published_at
      t.integer :user_id, index: true
      t.integer :category_id, index: true
      t.string :image_uid
      t.timestamps
    end

    #Categories
    create_table :cardboard_blog_categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :cardboard_blog_tags do |t|
      t.string :name
    end
  end
end
