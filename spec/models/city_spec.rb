require 'rails_helper'

RSpec.describe City, type: :model do

  let(:country) { FactoryBot.create(:country) }
  let(:city) { FactoryBot.create(:city, country: country) }

  context 'associations' do
    it { should have_many(:users) }
    it { should belong_to(:country) }
  end

  context '#check_validation' do
    it 'is valid with all attributes' do
      expect(city).to be_valid
    end
    it 'is not valid city name' do
      test = City.new(name: nil)
      expect(test).to_not be_valid
    end
    it 'is not valid country relation' do
      test = City.new(country_id: nil)
      expect(test).to_not be_valid
    end
  end

end
