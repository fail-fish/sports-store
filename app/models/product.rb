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
  validates :name, presence: true, length: { in: 2..160 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :price, presence: true, numericality: true
end
