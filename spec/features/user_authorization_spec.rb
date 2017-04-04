require 'spec_helper'

RSpec.describe "User Authentication", :js => :true do
  scenario "User who is not logged in is redirected to login" do
    visit '/'

    expect(current_path).to eq(login_path)
  end

  scenario "User registers account" do
    visit '/'
    click_link_or_button "Sign Up"
    fill_in 'user_email', :with => 'annwolffe@gmail.com'
    fill_in 'user_password', :with => 'boom'
    fill_in 'user_password_confirmation', :with => 'boom'
    click_on 'Create Account'

    expect(current_path).to eq(links_path)
  end

  scenario "User sees correct flash message when not providing email" do
    visit new_user_path
    fill_in 'user_password', :with => 'boom'
    fill_in 'user_password_confirmation', :with => 'boom'
    click_on 'Create Account'

    expect(page).to have_content("Email can't be blank")
    expect(page).to_not have_content("Password confirmation doesn't match Password")
    expect(page).to_not have_content("Password confirmation cannot be blank")

  end

  scenario "User sees correct flash message when not providing password confirmation" do
    visit new_user_path
    fill_in 'user_email', :with => 'annwolffe@gmail.com'
    fill_in 'user_password', :with => 'boom'
    click_on 'Create Account'

    expect(page).to have_content("Password confirmation doesn't match Password") 
  end
  
  scenario "User sees correct flash message when not providing correct password confrimation" do
    visit new_user_path
    fill_in 'user_email', :with => 'annwolffe@gmail.com'
    fill_in 'user_password', :with => 'boom'
    fill_in 'user_password_confirmation', :with => 'boomboom'
    click_on 'Create Account'

    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to_not have_content("Password confirmation cannot be blank")
  end

end
