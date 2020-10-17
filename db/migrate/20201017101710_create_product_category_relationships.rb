class CreateProductCategoryRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :product_category_relationships do |t|
      t.references :product, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
