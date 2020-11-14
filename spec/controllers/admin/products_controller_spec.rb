require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  let!(:category) { create(:category, :with_products) }
  let(:products) { category.products }
  let(:product) { products.first }
  let!(:admin) { create(:admin) }
  let(:product_params) { FactoryBot.attributes_for(:product).merge(category_ids: [category.id]) }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it 'Returns products objects' do
      expect(assigns(:products)).to eq(products)
    end

    it 'Render index template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end

    it 'Initiales empty product object' do
      expect(assigns(:product)).to be_a_new(Product)
    end

    it 'Render new template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('new')
    end
  end

  describe 'GET #edit' do
    before do
      get :edit, params: { id: product.id }
    end

    it 'Returns category object' do
      expect(assigns(:product)).to eq(product)
    end

    it 'Render edit template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('edit')
    end
  end

  describe 'POST #create' do
    it 'Create a new product' do
      expect do
        post :create, params: { product: product_params }
      end.to change(Product, :count).by(1)
    end

    it 'Redirects to the products path' do
      post :create, params: { product: product_params }

      is_expected.to set_flash[:notice]
      is_expected.to redirect_to(admin_products_path)
    end
  end

  describe 'PUT #update' do
    before do
      patch :update, params: { id: product.id, product: product_params }
    end

    it 'Redirects to the products path' do
      is_expected.to set_flash[:notice]
      is_expected.to redirect_to(admin_products_path)
    end
  end

  describe 'DELETE #destroy' do
    it 'Deletes products' do
      expect do
        delete :destroy, params: { id: product.id }
      end.to change(Product, :count).by(-1)
    end

    it 'Redirects to units' do
      delete :destroy, params: { id: product.id }

      is_expected.to set_flash[:notice]
      is_expected.to redirect_to(admin_products_path)
    end
  end
end
