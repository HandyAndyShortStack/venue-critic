require "spec_helper"

feature "Signing out" do
  before do
    user = Factory(:confirmed_user)
    sign_in_as!(user)
  end

  scenario "Signing out a user" do
    visit "/"
    click_link "Sign out"
    page.should_not have_content("Signed in as")
  end
end

