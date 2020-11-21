require 'rails_helper'

RSpec.describe Admin::OrdersController, type: :controller do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:product) { create(:product) }
  let!(:order) { create(:order, product: product, user: user) }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it 'Returns category objects' do
      expect(assigns(:orders)).to eq([order])
    end

    it 'Render index template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('index')
    end
  end
end
