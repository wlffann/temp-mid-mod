require 'rails_helper'

describe 'Filter links', :js => true do
  before do
    user = create(:user)
    @link1, @link2, @link3 = create_list(:link, 3, user: user)
    @link4 = create(:link, title: "Specific Title", user: user)
    @link1.read = true
    @link2.read = true
    @link1.save
    @link2.save
    stub_login(user)
    visit links_path
  end

  it 'by read' do
    click_on 'Show Read'

    expect(current_path).to eq(links_path)
    expect(page).to have_selector('.link', count: 2)
    expect(page).to have_content @link1.title
    expect(page).to have_content @link1.url
    expect(page).to have_content @link2.title
    expect(page).to have_content @link2.url
  end

  it 'by unread' do
    click_on 'Show Unread'

    expect(current_path).to eq(links_path)
    expect(page).to have_selector('.link', count: 2)
    expect(page).to have_content @link3.title
    expect(page).to have_content @link3.url
    expect(page).to have_content @link4.title
    expect(page).to have_content @link4.url
  end

  it 'by title with matches' do
    fill_in 'text_filter', :with => "Specific"

    expect(page).to have_selector('.link', count: 1)
    expect(page).to have_content @link4.title
    expect(page).to have_content @link4.url
  end
  
  it 'by title with no matches' do
    fill_in 'text_filter', :with => "ZZ"

    expect(page).to_not have_selector('.link')
  end
end
