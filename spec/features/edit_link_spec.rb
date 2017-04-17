require 'rails_helper'

describe 'Editing Links' do
  before do
    user = create(:user)
    @link = create(:link, user: user)
    stub_login(user)
    
    visit '/'
    click_on "Edit"
  end
  
  it 'can be done from the index page' do
    fill_in 'link_title', :with => 'New Name'
    click_on 'Update Link'

    expect(current_path).to eq('/')
    within '.link' do
      expect(page).to have_content 'New Name'
    end
  end

  it 'can only be done with valid urls' do
    fill_in 'link_url', :with => 'not a url'
    click_on 'Update Link'

    expect(page).to have_content('Those updates are invalid')
  end
end
