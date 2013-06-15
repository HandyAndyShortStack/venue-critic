require "spec_helper"

feature "editing venues" do
  
  let!(:venue) { Factory(:venue) }

  scenario "editing a venue" do
    
    visit "/venues"
    click_link "Wally's"
    click_link "edit venue information"
    fill_in "Allages", with: "yes"
    click_button "Update Venue"

    page.should have_content "Venue information updated"
    page.should have_content "yes"

  end

end
