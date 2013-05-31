class CreateCardboardBlogPosts < ActiveRecord::Migration
  def change
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
  end
end
