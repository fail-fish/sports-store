require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let!(:user) { create(:user) }

  setup do
    @current_user = user
  end

  describe '.active_class' do
    let(:link_path) { '127.11.21/home' }
    let(:url_helper) { ActionView::Helpers::UrlHelper }

    context 'Link path is current' do
      before do
        allow_any_instance_of(url_helper).to receive(:current_page?).with(link_path)
                                                                    .and_return(true)
      end

      it 'Returns active class string' do
        expect(active_class(link_path)).to eq('nav-item active')
      end
    end

    context 'Link path is not current' do
      before do
        allow_any_instance_of(url_helper).to receive(:current_page?).with(link_path)
                                                                    .and_return(false)
      end

      it 'Doesn\'t returns active class string' do
        expect(active_class(link_path)).to eq('nav-item')
      end
    end
  end

  describe 'user_has_products_in_carts?' do
    context 'When cart_count bigger than 0' do
      before do
        allow(user).to receive(:cart_count).and_return(1)
      end

      it 'Returns true' do
        expect(user_has_products_in_carts?).to be_truthy
      end
    end
  end

  attr_reader :current_user
end
