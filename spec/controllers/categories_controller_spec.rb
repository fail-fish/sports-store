require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let!(:category) { create(:category, :with_products) }
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #show' do
    before do
      get :show, params: { id: category.id }
    end

    it 'Returns category object' do
      expect(assigns(:category)).to eq(category)
    end

    it 'Render show template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('show')
    end
  end
end
