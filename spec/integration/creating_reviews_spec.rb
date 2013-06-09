require "spec_helper"

feature "creating reviews" do

  let!(:venue) { Factory(:venue) }

  scenario "creating a new review" do

    visit "venues"
    click_link "Wally's"
    click_link "review this venue"
    fill_in "Overall", with: 5
    fill_in "Note", with: "This place has great ribs!!"
    fill_in "Dispute", with: "We were attacked by the coat check girl."
    fill_in "Soundequip", with: 2
    fill_in "Soundtech", with: 3
    fill_in "Compensation", with: 5
    fill_in "Compdescr" "We were paid a $500 guarantee, with 40% of the door on top of that"
    click_button "Create Review"

    page.should have_content "review created sucessfully"
    page.should have_content "This place has great ribs!"

  end

end
