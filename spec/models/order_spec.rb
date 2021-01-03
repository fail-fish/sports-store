# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_orders_on_product_id  (product_id)
#  index_orders_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'Validation' do
    context 'Presence validation' do
      it { is_expected.to validate_presence_of(:quantity) }
    end

    context 'Numericality validation' do
      it { is_expected.to validate_numericality_of(:quantity) }
    end
  end
end
