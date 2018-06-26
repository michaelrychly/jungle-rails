require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    User.create!(
      first_name: "Stefan",
      last_name: "Test",
      email: "StefanTest@gmail.com",
      password: "1234567")
  end

  scenario "Login a user successful" do
    # ACT
    visit root_path

    click_on "Login"
    fill_in "Email", with: 'StefanTest@gmail.com'
    fill_in "Password", with: '1234567'
    click_button "Login"
    save_screenshot
    # DEBUG / VERIFY
    expect(page).to have_content('Signed in as StefanTest@gmail.com')
  end
end
