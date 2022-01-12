require 'rails_helper'

RSpec.feature "Visitor can login", type: :feature, js: true do
  
  before :each do
    User.create!(
      first_name: "Eavan",
      last_name: "Kim",
      email: "eavan@gmail.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  scenario "If they have an account, they can login" do
    visit new_session_path

    fill_in 'email', with: "eavan@gmail.com"
    fill_in 'password', with: "password"
    find('input.btn').click # login button

    expect(page).to have_content 'Eavan' # User name on home page

    find('[data-test="logout"]').click # click user name for logout button
    expect(page).to have_content 'Logout'
    
    # save_screenshot
    # save_and_open_page
  end
end
