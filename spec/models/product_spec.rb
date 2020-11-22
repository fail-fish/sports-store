# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :text             not null
#  name        :string           not null
#  price       :decimal(8, 2)    not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:product_category_relationships).dependent(:destroy) }
    it { is_expected.to have_many(:categories).through(:product_category_relationships) }
    it { is_expected.to have_many(:orders).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:orders) }
  end

  describe 'Validation' do
    context 'Presence validation' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:price) }
    end

    context 'Length validation' do
      it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(160) }
      it { is_expected.to validate_length_of(:description).is_at_most(250) }
    end

    context 'Numericality validation' do
      it { is_expected.to validate_numericality_of(:price) }
    end

    describe 'Image validation' do
      it do
        is_expected.to validate_content_type_of(:image_file).allowing('image/png',
                                                                      'image/jpg',
                                                                      'image/jpeg')
      end

      it { is_expected.to validate_size_of(:image_file).less_than(1.megabytes) }
    end
  end
end
