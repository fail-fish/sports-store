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
FactoryBot.define do
  factory :order do
    product { nil }
    user { nil }
    quantity { 1 }
  end
end
