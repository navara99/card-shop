require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  
  before :each do
    @user = User.create!(
    first_name: "Jesus",
    last_name: "Barnum",
    email: "jesusdbarnum@dayrep.com",
    password:"12345678",
    password_confirmation:"12345678"
    )
  end

  scenario "User can log in" do
    visit root_path

    within("#navbar") do 
      expect(page).to have_content("Login")
      expect(page).to have_content("Signup")
      click_on "Login"
    end

    within("main.container") do
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")

      fill_in "Email", with: "Jesusdbarnum@dayrep.com"
      fill_in "Password", with: "12345678"

      click_on "Login"
    end

    within("#navbar") do 
      expect(page).to have_content("Logged in as: jesusdbarnum@dayrep.com")
      expect(page).to have_content("Logout")
    end
    
  end

end
