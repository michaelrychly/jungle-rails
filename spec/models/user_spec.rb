require 'rails_helper'
require '././app/models/user'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a user' do
      expect(subject).to be_a User
    end

    describe 'presence validations' do
      it {should validate_presence_of(:first_name)}
      it {should validate_presence_of(:last_name)}
      it {should validate_presence_of(:email)}
    end

    describe 'uniqueness validations' do
      it {should validate_uniqueness_of(:email)}
    end

    describe 'password validations' do
      it {should validate_confirmation_of(:password)}
      it {should validate_length_of(:password).is_at_least(7).on(:create)}
    end
  end

  describe '.authenticate_with_credentials' do

  end
end