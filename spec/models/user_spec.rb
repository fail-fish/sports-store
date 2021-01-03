# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
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
require 'rails_helper'

RSpec.describe User, type: :model, redis_mock: true do
  let!(:user) { create(:user) }
  let(:product_id) { 'product_id' }

  describe 'Associations' do
    it { is_expected.to have_many(:orders).dependent(:destroy) }
    it { is_expected.to have_many(:products).through(:orders) }
  end

  describe '.current_user_cart' do
    it 'Returns string whith user id' do
      expect(user.current_user_cart).to eq("cart#{user.id}")
    end
  end
end
