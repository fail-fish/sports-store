require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let!(:product) { create(:product) }

  describe 'GET #index' do
    before do
      get :index
    end

    it 'Returns product objects' do
      expect(assigns(:products)).to eq([product])
    end

    it 'Render index template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('index')
    end
  end

  describe 'Get #show' do
    before do
      get :show, params: { id: product.id }
    end

    it 'Returns category object' do
      expect(assigns(:product)).to eq(product)
    end

    it 'Render show template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('show')
    end
  end
end
