require "spec_helper"

feature "Signing in" do

  let!(:user) { Factory(:user) }
  let!(:confirmed_user) { Factory(:confirmed_user) }

  scenario "Signing in via confirmation" do
    open_email user.email, with_subject: /Confirmation/
    click_first_link_in_email
    page.should have_content("Your account was successfully confirmed")
    page.should have_content("Signed in as #{user.email}")
  end

  scenario "Signing in via form" do
    visit "/"
    click_link "Sign in"
    fill_in "Username", with: confirmed_user.username
    fill_in "Email", with: confirmed_user.email
    fill_in "Password", with: confirmed_user.password
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end
end

