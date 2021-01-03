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
require 'rails_helper'

RSpec.describe ProductCategoryRelationship, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:category) }
  end
end
