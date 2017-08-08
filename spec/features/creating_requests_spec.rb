feature 'Creating requests' do
  scenario 'it can request a booking' do
    visit '/listings/new'
    fill_in :name, with: 'Our beautiful home!!'
    click_button 'Create listing'
    click_button 'Request to book 1'
    #expect(current_path).to eq '/listings/1'
    fill_in :guest_name, with: 'Mickey Mouse'
    fill_in :guest_email, with: 'mickey@mouse.com'
    click_button 'Request to book'
    expect(page).to have_content 'Booking confirmed!'
  end
end
