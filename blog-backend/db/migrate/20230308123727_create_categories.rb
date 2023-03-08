class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.references :parent, class_name: 'Category', foreign_key: { to_table: :categories, on_delete: :nullify}

    end

    add_index :categories, :name
  end
end
