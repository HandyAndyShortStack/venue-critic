require "spec_helper"

feature "editing reviews" do

  before do
    user = Factory(:confirmed_user)
    sign_in_as!(user)
  end

  let!(:venue) { Factory(:venue) }
  let!(:review) { Factory(:review) }

  scenario "editing a review" do

    visit "/venues"
    click_link "Wally's"
    click_link "read more"
    click_link "edit this review"
    fill_in "Note", with: "This place has really cheap pitchers!"
    click_button "Update Review"

    page.should have_content "Review updated"
    page.should have_content "This place has really cheap pitchers!"

  end

end
