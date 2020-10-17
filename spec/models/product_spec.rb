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
  describe 'Validation' do
    context 'Presence validation' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:price) }
    end

    context 'Length validation' do
      it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(60) }
      it { is_expected.to validate_length_of(:description).is_at_most(250) }
    end

    context 'Numericality validation' do
      it { is_expected.to validate_numericality_of(:price) }
    end
  end
end
