# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many :product_category_relationships, dependent: :destroy
  has_many :products, through: :product_category_relationships

  validates :name, presence: true, length: { in: 4..120 }
end
