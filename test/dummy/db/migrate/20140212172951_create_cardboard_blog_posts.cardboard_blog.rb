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
      t.integer :user_id

      t.timestamps
    end
    add_index :cardboard_blog_posts, :user_id

    #Categories
    create_table :cardboard_blog_categories do |t|
      t.string :name

      t.timestamps
    end

    # Images
    create_table :cardboard_blog_images do |t|
      t.string :file_uid
      t.string :file_name
      t.string :caption
      t.references :post

      t.timestamps
    end
    add_index :cardboard_blog_images, :post_id

    # Relational table
    create_table :cardboard_categories_posts, id: false do |t|
      t.references :category
      t.references :post
    end
    add_index :cardboard_categories_posts, [:category_id, :post_id]
    add_index :cardboard_categories_posts, [:post_id, :category_id]
  end
end
