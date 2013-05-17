class CreateCardboardBlogImages < ActiveRecord::Migration
  def change
    create_table :cardboard_blog_images do |t|
      t.string :file_uid
      t.string :file_name
      t.string :caption
      t.references :post

      t.timestamps
    end
    add_index :cardboard_blog_images, :post_id
  end
end
