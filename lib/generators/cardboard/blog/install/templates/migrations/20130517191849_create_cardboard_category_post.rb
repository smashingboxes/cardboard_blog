class CreateCardboardCategoryPost < ActiveRecord::Migration
  create_table :cardboard_categories_posts, id: false do |t|
    t.references :category
    t.references :post
  end
  add_index :cardboard_categories_posts, [:category_id, :post_id]
  add_index :cardboard_categories_posts, [:post_id, :category_id]
end
