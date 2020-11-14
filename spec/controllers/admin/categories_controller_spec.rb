require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  let!(:category) { create(:category) }
  let!(:admin) { create(:admin) }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it 'Returns category objects' do
      expect(assigns(:categories)).to eq([category])
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

    it 'Initiales empty category object' do
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'Render new template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('new')
    end
  end

  describe 'GET #edit' do
    before do
      get :edit, params: { id: category.id }
    end

    it 'Returns category object' do
      expect(assigns(:category)).to eq(category)
    end

    it 'Render edit template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('edit')
    end
  end

  describe 'POST #create' do
    it 'Create a new category' do
      expect do
        post :create, params: { category: { name: 'category' } }
      end.to change(Category, :count).by(1)
    end

    it 'Redirects to the categories path' do
      post :create, params: { category: { name: 'category' } }

      is_expected.to set_flash[:notice]
      is_expected.to redirect_to(admin_categories_path)
    end
  end

  describe 'PUT #update' do
    before do
      patch :update, params: { id: category.id, category: { name: 'category' } }
    end

    it 'Redirects to the categories path' do
      is_expected.to set_flash[:notice]
      is_expected.to redirect_to(admin_categories_path)
    end
  end

  describe 'DELETE #destroy' do
    it 'Deletes categorie' do
      expect do
        delete :destroy, params: { id: category.id }
      end.to change(Category, :count).by(-1)
    end

    it 'Redirects to units' do
      delete :destroy, params: { id: category.id }

      is_expected.to set_flash[:notice]
      is_expected.to redirect_to(admin_categories_path)
    end
  end
end
