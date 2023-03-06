class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :category
      t.text :description
      t.references :author, null: false, foreign_key: true
      t.datetime :created_at
      t.string :cover
    end
  end
end

