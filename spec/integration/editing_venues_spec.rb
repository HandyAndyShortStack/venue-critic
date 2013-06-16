require "spec_helper"

feature "editing venues" do

  let!(:venue) { Factory(:venue, user_id: user.id) }
  let!(:user) { Factory(:confirmed_user) }

  scenario "editing a venue" do

    sign_in_as!(user)
    visit "/venues"
    click_link "Wally's"
    click_link "edit venue information"
    fill_in "Allages", with: "yes"
    click_button "Update Venue"

    page.should have_content "Venue information updated"
    page.should have_content "yes"

  end

end
