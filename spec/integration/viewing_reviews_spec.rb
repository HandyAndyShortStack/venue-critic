require "spec_helper"

feature "viewing reviews" do
  
  let!(:venue) { Factory(:venue) }
  let!(:review) { Factory(:review) }

  scenario "viewing a review" do

    visit "/venues"

    click_link "Wally's"
    click_link "read more"

    page.should have_content("Wally's")
    page.should have_content("This place has great ribs!!")
    page.should have_content("We were paid a $500 guarantee")

  end

end
