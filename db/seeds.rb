user = FactoryBot.create(:user,
                         email: 'store_user@gmail.com',
                         password: '123456',
                         password_confirmation: '123456')

FactoryBot.create(:admin,
                  email: 'store_admin@gmail.com',
                  password: '123456',
                  password_confirmation: '123456')

FactoryBot.create(:category, :with_products)

Product.first(5).each do |product|
  FactoryBot.create(:order, product: product, user: user)
end

predefined_caregories = ['Сlothes for Sport',
                         'Sneakers for Sports',
                         'Sports Inventory',
                         'Discounts']

predefined_caregories.each do |predefined_caregory|
  FactoryBot.create(:category, name: predefined_caregory)
end
