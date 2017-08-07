feature 'Creating listings' do
  scenario 'it can create a listing' do
    visit '/listings/new'
    fill_in :name, with: 'My beautiful home'
    click_button 'Create listing'
    expect(current_path).to eq '/listings'

    # within 'ul#listings' do
      expect(page).to have_content('My beautiful home')
    # end
  end
end
