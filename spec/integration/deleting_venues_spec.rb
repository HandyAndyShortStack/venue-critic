require "spec_helper"

feature "deleting venues" do
  
  let!(:venue) { Factory(:venue) }

  scenario "deleting a venue" do

    visit "/venues"
    click_link "Wally's"
    click_button "delete venue information"

    page.should have_content("Venue information destroyed")
    page.should_not have_content("Wally's")

  end

end
