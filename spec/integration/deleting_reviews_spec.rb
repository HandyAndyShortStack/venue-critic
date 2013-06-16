require "spec_helper"

feature "deleting reviews" do

  let!(:user) { Factory(:confirmed_user) }
  let!(:venue) { Factory(:venue, user_id: user.id) }
  let!(:review) { Factory(:review, user_id: user.id) }

  scenario "deleting a review" do
    sign_in_as!(user)

    visit "/venues"
    click_link "Wally's"
    click_link "read more"
    click_button "delete this review"

    page.should have_content("Review destroyed")
    page.should_not have_content("read more")
  end

end
