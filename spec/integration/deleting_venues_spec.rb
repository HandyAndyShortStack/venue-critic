require "spec_helper"

feature "deleting venues" do

  let!(:user) { Factory(:confirmed_user, role: 'admin') }
  let!(:venue) { Factory(:venue) }

  scenario "deleting a venue as admin" do

    sign_in_as!(user)
    visit "/venues"
    click_link "Wally's"
    click_button "delete venue information"

    page.should have_content("Venue information destroyed")
    page.should_not have_content("Wally's")

  end

end
