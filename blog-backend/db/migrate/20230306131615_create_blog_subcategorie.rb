class CreateBlogSubcategorie < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_subcategories do |t|
      t.integer :blog_id
      t.integer :subcategory_id
    end
  end
end
