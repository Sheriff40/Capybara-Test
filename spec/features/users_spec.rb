require 'rails_helper'

RSpec.feature "Users", driver: :selenium_chrome do

  scenario 'Signing in with correct credentials' do

    visit '/users/sign_in'

    within('#new_user') do
      fill_in(id: 'user_email', with: user.email)
      fill_in(type: 'password', with: user.password)
    end

    click_on 'Log in'

    # expect(page).to have_xpath '//*[@id="nav-tab"]/a[3]/div'
    # expect(page).to have_content 'Log Out'
    # expect(page).to have_current_path "/"

    expect(page).to have_link 'Log Out'
  end

  scenario 'Signing in with incorrect credentials' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'passwords'
    end

    click_button 'Log in'

    accept_confirm do
      page.execute_script("confirm('Are you sure you want to delete?')")
    end

    expect(page).to have_content('Invalid Email or password.')
  end


  scenario 'Open google' do
    visit('http://www.google.com')
    expect(page).to have_content("Google")
  end

end
