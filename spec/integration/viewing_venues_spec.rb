require "spec_helper"

feature "viewing venues" do
  
  let!(:venue) { Factory(:venue) }

  scenario "viewing a venue" do

    visit "/venues"
    click_link "Wally's"

    page.should have_content("Wally's")
    page.should have_content("down by the railroad tracks")
    page.should have_content("Lake City")

  end

end
