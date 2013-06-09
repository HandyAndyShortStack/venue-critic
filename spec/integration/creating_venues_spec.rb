require "spec_helper"

feature "creating a venue" do
  
  scenario "creating a venue from homepage" do

    visit "/"
    click_link "add a new venue"
    fill_in "Name", with: "Wally's"
    fill_in "Address", with: "down by the railroad tracks"
    fill_in "Neighborhood", with: "Lake City"
    fill_in "Alcohol", with: "yes"
    fill_in "Allages", with: "no"
    fill_in "Stagesize", with: "small"
    click_button "Create Venue"

    page.should have_content("Venue information saved")
    page.should have_content("Wally's")
    page.should have_content("down by the railroad tracks")
    page.should have_content("Lake City")

  end

end
