require 'rails_helper'

describe User do

  context 'associations' do
    it { should have_many(:bills) }
    it { should have_many(:manager_notifications) }
    it { should have_many(:bill_requests) }
  end

  context '.admins' do
    before do
      @users = FactoryBot.create_list(:user, 3)
      @admins = FactoryBot.create_list(:admin, 3)
    end

    it 'returns list of admins' do
      expect(User.admins).to match_array(@admins)
    end

    it "doesn't return regular users" do
      expect(User.admins).not_to match_array(@users)
    end
  end

  context '#names_check' do
    it 'validates user first, last and second names ERROR' do
      record = create_user
      record.valid?
      record.errors[:first_name][0].should include('must start with upper case')
      record.errors[:last_name][0].should include('must start with upper case')
    end

    it 'validates user first, last and second names SUCCESS' do
      record = create_user
      record.first_name[0] = record.first_name[0].upcase
      record.last_name[0] = record.last_name[0].upcase
      record.valid?
      record.errors[:first_name][0].nil?
      record.errors[:last_name][0].nil?
    end
  end

  context '#phonde_validation' do
    it 'phone short not valid' do
      test = User.new(phone: '222222')
      expect(test).to_not be_valid
    end
    it 'phone long not valid' do
      test = User.new(phone: '222222222222222222')
      expect(test).to_not be_valid
    end
  end

  context '#email_validation' do
    it 'email start "test" not valid' do
      test = User.new(email: 'test.gmail.com')
      expect(test).to_not be_valid
    end
    it 'email end "test.com" not valid' do
      test = User.new(email: 'dasdasd@test.com')
      expect(test).to_not be_valid
    end
  end


  private

  def create_user
    record = User.new
    record.first_name = FFaker::Name.first_name.downcase
    record.last_name = FFaker::Name.last_name.downcase
    record
  end

end
