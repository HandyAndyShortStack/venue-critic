module AuthenticationHelpers
  def sign_in_as!(user)
    visit "/users/login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end

  def logged_in?
    page.has_selector? "a", text: "logout"
  end

  def login_with(provider, mock_options = nil)
    if mock_options == :invalid_credentials
      OmniAuth.config.mock_auth[provider] = :invalid_credentials
    elsif mock_options
      OmniAuth.config.add_mock provider, mock_options
    end
    visit "/auth/#{provider}"
  end
end

RSpec.configure do |c|
  c.include AuthenticationHelpers, type: :request
end

