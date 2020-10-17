# == Schema Information
#
# Table name: product_category_relationships
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  product_id  :integer
#
# Indexes
#
#  index_product_category_relationships_on_category_id  (category_id)
#  index_product_category_relationships_on_product_id   (product_id)
#
class ProductCategoryRelationship < ApplicationRecord
  belongs_to :product
  belongs_to :category
end
