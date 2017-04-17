require 'rails_helper'

RSpec.describe 'Submitting new links', :js => :true do
  before do
    user = create(:user)
    stub_login(user)
    visit links_path
  end
  
  it 'defaults to unread' do
    fill_in 'link_title', :with => "Turing School"
    fill_in 'link_url', :with => "http://www.turing.io/"
    click_link_or_button 'Add Link'

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Turing School")
    expect(page).to have_content("http://www.turing.io/")
    expect(Link.first.read).to eq(false)
  end

  it 'requires a good url' do
    fill_in 'link_title', :with => "Turing School"
    fill_in 'link_url', :with => "turing.io/"
    click_link_or_button 'Add Link'

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Url must be valid")
  end
end
