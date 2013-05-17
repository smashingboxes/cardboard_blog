class CreateCardboardBlogCategories < ActiveRecord::Migration
  def change
    create_table :cardboard_blog_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
