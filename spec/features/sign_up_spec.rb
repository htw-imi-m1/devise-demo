require 'rails_helper'
feature "SignUp Process" do

    it "shows the Sign up link" do
      visit root_path
      expect(page).to have_content "Sign up"
    end

    it "signs up a new user" do
      visit root_path
      click_on "Sign up"
      fill_in 'Email', with: "new_user@backlog.com"
      fill_in 'user_password', with: 'geheim132'
      fill_in 'user_password_confirmation', with: 'geheim132'
      click_on "Sign up"
      expect(page).to have_content "User Stories"
    end
end
