require "spec_helper"

feature "Using Login Button" do
  before do
    visit "/"
    logged_in?.should be_false
  end

  scenario "using Twitter" do
    OmniAuth.config.add_mock(:twitter, { uid: "twitter-12345" })
    click_link "Login with Twitter"
    page.should have_content "Logged into Twitter as Bob Smith (twitter-12345)"
    logged_in?.should be_true
  end

  scenario "invalid login" do
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
    click_on "Login with Twitter"
    page.should have_content("login failed")
    logged_in?.should be_false
  end
end

