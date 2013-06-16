require "spec_helper"

feature "editing reviews" do

  let!(:user) { Factory(:confirmed_user) }
  let!(:venue) { Factory(:venue) }
  let!(:review) { Factory(:review, user_id: user.id) }

  scenario "editing a review" do

    sign_in_as!(user)
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
