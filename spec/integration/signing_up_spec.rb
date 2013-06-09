require "spec_helper"

feature "signing up a new user" do
  scenario "Successful sign up" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "this@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    message = "A message with a confirmation link has been sent " +
      "to your email address. Please open the link to activate your account."
    page.should have_content(message)
  end
end
