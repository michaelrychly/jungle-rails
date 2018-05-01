require 'rails_helper'
require '././app/models/user'
require 'database_cleaner'

DatabaseCleaner.strategy = :deletion

RSpec.describe User, type: :model do
  DatabaseCleaner.start
  #subject { User.new(first_name: "Michael", last_name: "Me", email: "test@gmail.com", password_digest: "ithastobe7") }

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
      @user = User.create!(first_name: "Michael", last_name: "RSpec",
                          email: "MichaelRSpec@gmail.com", password: "ithastobe7")
     #MichaelMe@gmail.com
     #@users = subject.authenticate_with_credentials("test@gmail.com", "ithastobe7")
     #puts "in test #{@users.inspect}"
     it 'should return a user' do
      expect(@user.authenticate_with_credentials("test@gmail.com", "ithastobe7")).to be_a User
     end
  end
  DatabaseCleaner.clean
end