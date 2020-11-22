# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :text             not null
#  name        :string           not null
#  price       :decimal(8, 2)    not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  has_many :product_category_relationships, dependent: :destroy
  has_many :categories, through: :product_category_relationships
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders

  has_one_attached :image_file

  validates :image_file,
            content_type: %w[image/png image/jpg image/jpeg],
            size: { less_than: 1.megabytes,
                    message: 'is not given between size' }

  validates :name, presence: true, length: { in: 2..160 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :price, presence: true, numericality: true

  scope :latest, -> { order(created_at: :desc) }
end
