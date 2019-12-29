require 'rails_helper'

RSpec.describe Country, type: :model do

  let(:country) { FactoryBot.create(:country) }

  context 'associations' do
    it { should have_many(:cities) }
  end

  context '#check_validation' do
    it 'is valid with all attributes' do
      expect(country).to be_valid
    end
  end
end
