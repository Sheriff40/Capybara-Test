require 'rails_helper'

RSpec.feature "Signing Post", type: :feature, driver: :selenium_chrome do

  user =  User.create!(email: 'sheriffhussain40@gmail.com',password: 'password')

  background do
      simulate_log_in(user.email, user.password)
  end

  scenario 'Create Post' do

    # sign_in(user) // This is devise sign_in helper for integration testing. We need to include Devise::Test::IntegrationHelpers

    visit '/posts/new'

    within '#new_post' do
      fill_in 'Title', with: "New Post"
      fill_in 'Price', with: 300
      fill_in 'Date', with: Date.today
      choose 'Male'
      check 'Momo'
      attach_file('Image', File.join(Rails.root, '/app/assets/images/avatar.png'))
      select('Football', from: 'Hobby')
    end

    # Capybara.match = :prefer_exact

    click_on 'Create Post', exact: true

    # Debugging Tools
    # save_and_open_screenshot
    # save_and_open_page

    expect(page).to have_content("Post was successfully created.")
  end

  scenario "Delete Post" do

    visit '/posts'
    within 'table' do
      accept_confirm do
        find_link(class: ['tester']).click
      end
    end
    expect(page).to have_content("Post was successfully destroyed.")
  end



end