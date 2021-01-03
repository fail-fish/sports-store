# == Schema Information
#
# Table name: product_category_relationships
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  product_id  :bigint
#
# Indexes
#
#  index_product_category_relationships_on_category_id  (category_id)
#  index_product_category_relationships_on_product_id   (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (product_id => products.id)
#
FactoryBot.define do
  factory :product_category_relationship do
    product { nil }
    category { nil }
  end
end
