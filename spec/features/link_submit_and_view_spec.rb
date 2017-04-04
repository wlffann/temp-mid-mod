require 'rails_helper'

RSpec.describe 'Submitting new links', :js => :true do
  it 'defaults to unread' do
    user = create(:user)
    stub_login(user)
    visit links_path
    fill_in 'link_title', :with => "Turing School"
    fill_in 'link_url', :with => "http://www.turing.io/"
    click_link_or_button 'Add Link'

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Turing School")
    expect(page).to have_content("http://www.turing.io/")
    expect(Link.first.read).to eq(false)
  end
end
