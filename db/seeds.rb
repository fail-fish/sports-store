FactoryBot.create(:user,
                  email: 'store_user@gmail.com',
                  password: '123456',
                  password_confirmation: '123456')

FactoryBot.create(:category, :with_products)
