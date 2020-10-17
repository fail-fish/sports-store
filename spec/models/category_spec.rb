# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validation' do
    context 'Presence validation' do
      it { is_expected.to validate_presence_of(:name) }
    end

    context 'Length validation' do
      it { is_expected.to validate_length_of(:name).is_at_least(4).is_at_most(120) }
    end
  end
end
