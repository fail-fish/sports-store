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
class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :quantity, presence: true, numericality: true
end
