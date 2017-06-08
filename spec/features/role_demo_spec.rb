require 'rails_helper'
include ApplicationHelper
describe "Roles", :type => :feature do


  context "logged in: team" do
    before(:each) do
      @user = create(:user)
      sign_in @user
    end
    it "shows the user stories page" do
      visit user_stories_path
      expect(page).to have_content("User Stories")
    end
    it "on the role demo page" do
      visit roles_demo_path
      expect(page).to have_content("Roles Demo")
      expect(page).to have_content("This can only be seen by Team Members.")
      expect(page).to have_content("team: true")
      expect(page).to have_content("admin: false")
      expect(page).to have_content("product_owner: false")
    end
    it "can see the Team Only Demo" do
      visit roles_demo_team_path
      expect(page).to have_content("Team Only Demo")
    end

    it "cannot see the Product Owner Only Demo" do
      visit roles_demo_po_path
      expect(page).to have_content(missing_role([:product_owner]))
    end
    it "cannot see the Admin Only Demo" do
      visit roles_demo_admin_path
      expect(page).to have_content(missing_role([:admin]))
    end
    it "can see the Team And Product Owner Demo" do
      visit roles_demo_team_and_po_path
      expect(page).to have_content("Team And Product Owner Demo")
    end
  end


  context "logged in: admin" do
    before(:each) do
      @user = create(:admin)
      sign_in @user
    end
    it "shows the user stories page" do
      visit user_stories_path
      expect(page).to have_content("User Stories")
    end
    it "on the role demo page" do
      visit roles_demo_path
      expect(page).to have_content("Roles Demo")
      expect(page).to have_content("This can only be seen by admins.")
      expect(page).to have_content("team: false")
      expect(page).to have_content("admin: true")
      expect(page).to have_content("product_owner: false")
    end
    it "can see the Team Only Demo" do
      visit roles_demo_team_path
      expect(page).to have_content("Team Only Demo")
    end
    it "can see the Product Owner Only Demo" do
      visit roles_demo_po_path
      expect(page).to have_content("Product Owner Only Demo")
    end
    it "can see the Admin Only Demo" do
      visit roles_demo_admin_path
      expect(page).to have_content("Admin Only Demo")
    end
    it "can see the Team And Product Owner Demo" do
      visit roles_demo_team_and_po_path
      expect(page).to have_content("Team And Product Owner Demo")
    end
  end


  context "logged in: product_owner" do
    before(:each) do
      @user = create(:product_owner)
      sign_in @user
    end
    it "shows the user stories page" do
      visit user_stories_path
      expect(page).to have_content("User Stories")
    end
    it "on the role demo page" do
      visit roles_demo_path
      expect(page).to have_content("Roles Demo")
      expect(page).to have_content("This can only be seen by Product Owners.")
      expect(page).to have_content("team: false")
      expect(page).to have_content("admin: false")
      expect(page).to have_content("product_owner: true")
    end
    it "can see the Product Owner Only Demo" do
      visit roles_demo_po_path
      expect(page).to have_content("Product Owner Only Demo")
    end
    it "can see the Team And Product Owner Demo" do
      visit roles_demo_team_and_po_path
      expect(page).to have_content("Team And Product Owner Demo")
    end


    it "cannot see the Team Only Demo" do
      visit roles_demo_team_path
      expect(page).to have_content(missing_role([:team]))
    end
    it "cannot see the Admin Only Demo" do
      visit roles_demo_admin_path
      expect(page).to have_content(missing_role([:admin]))
    end

  end

  context "logged in: chicken" do
    before(:each) do
      @user = create(:chicken)
      sign_in @user
    end
    it "cannot see the Team And Product Owner Demo" do
      visit roles_demo_team_and_po_path
      expect(page).to have_content(missing_role([:product_owner,:team]))
    end
  end

end
