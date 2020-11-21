# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :products, through: :orders

  def current_user_cart
    "cart#{id}"
  end

  def add_to_cart(product_id)
    $redis.hincrby(current_user_cart, product_id, 1)
  end

  def remove_from_cart(product_id)
    $redis.hdel(current_user_cart, product_id)
  end

  def remove_one_from_cart(product_id)
    $redis.hincrby(current_user_cart, product_id, -1)
  end

  def cart_count
    quantities = $redis.hvals(current_user_cart)
    quantities.reduce(0) { |sum, qty| sum + qty.to_i }
  end

  def cart_total_price
    cart_products_with_qty.map do |product, qty|
      product.price * qty.to_i
    end.reduce(:+).to_f
  end

  def cart_products_with_qty
    cart_ids = []
    cart_qtys = []

    $redis.hgetall(current_user_cart).map do |key, value|
      cart_ids << key
      cart_qtys << value
    end

    cart_products = Product.find(cart_ids)
    cart_products.zip(cart_qtys)
  end

  def purchase_cart_products!
    cart_products_with_qty.each do |product, qty|
      orders.create(user: self, product: product, quantity: qty)
    end

    $redis.del(current_user_cart)
  end
end
