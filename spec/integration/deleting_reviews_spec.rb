require "spec_helper"

feature "deleting reviews" do
  
  let!(:venue) { Factory(:venue) }
  let!(:review) { Factory(:review) }

  before do
    user = Factory(:confirmed_user)
    sign_in_as!(user)
  end

  scenario "deleting a review" do

    visit "/venues"
    click_link "Wally's"
    click_link "read more"
    click_button "delete this review"

    page.should have_content("Review destroyed")
    page.should_not have_content("read more")

  end

end
