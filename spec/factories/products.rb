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
FactoryBot.define do
  factory :product do
    name { Faker::Food.ingredient }
    description { Faker::Food.description }
    price { 9.99 }
  end
end
