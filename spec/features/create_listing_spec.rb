feature 'Creating listings' do
  before do
    sign_up
    sign_in(email: 'coasters@kiteou.com',
    password: 'percy1234')
  end

  scenario 'it can create a listing' do
    visit '/listings/new'
    fill_in :name, with: 'My beautiful home'
    fill_in :description, with: 'A lovely place to relax and enjoy the sea air'
    fill_in :price, with: 50
    click_button 'Create listing'
    expect(current_path).to eq '/listings'

    within 'ul' do
      expect(page).to have_content('My beautiful home')
      expect(page).to have_content('lovely place')
      expect(page).to have_content(50)
    end
  end

  scenario 'it can create a more than one listing' do
    visit '/listings/new'
    fill_in :name, with: 'My beautiful home'
    fill_in :description, with: 'A lovely place to relax and enjoy the sea air'
    fill_in :price, with: 50
    click_button 'Create listing'
    visit '/listings/new'
    fill_in :name, with: 'Narrow boat in Cambridge'
    fill_in :description, with: 'Horrible, dingy, claustrophobia-inducing space'
    fill_in :price, with: 100
    click_button 'Create listing'
    expect(current_path).to eq '/listings'

    within 'ul' do
      expect(page).to have_content('Narrow boat in Cambridge')
      expect(page).to have_content('Horrible, dingy, claustrophobia-inducing space')
      expect(page).to have_content(100)
      expect(page).to have_content('My beautiful home')
      expect(page).to have_content('lovely place')
      expect(page).to have_content(50)
    end
  end

  scenario 'it contains first and last name of space owner' do
    create_listing
    listing = Listing.first
    user = User.get(listing.user_id)
    expect(page).to have_content('Coasters Kiteou')
    expect(user.first_name).to eq('Coasters')
  end

end
