module SessionHelper

  def simulate_log_in email,encrypted_password
    visit '/users/sign_in'

    within('#new_user') do
      fill_in(id: 'user_email', with: email)
      fill_in(type: 'password', with: encrypted_password)
    end

    click_on 'Log in'
  end

end