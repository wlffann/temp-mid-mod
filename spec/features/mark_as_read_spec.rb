require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = create(:user)
    create(:link, user: user)
    stub_login(user)
    visit "/"
    within('.read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.read-status') do
      expect(page).to have_text("true")
    end

  end
end
