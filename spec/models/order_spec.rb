# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_orders_on_product_and_user  (,)
#  index_orders_on_product_id        (product_id)
#  index_orders_on_user_id           (user_id)
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
