require 'rails_helper'
require '././app/models/user'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a user' do
      expect(subject).to be_a User
    end

    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}

    it {should validate_uniqueness_of(:email)}
  end
end