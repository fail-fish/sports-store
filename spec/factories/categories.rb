# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :category do
    name { 'Nutritional supplements' }

    trait :with_products do
      after(:build) do |category|
        category.products = build_list(:product, 10)
      end
    end
  end
end
