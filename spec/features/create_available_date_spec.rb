feature 'It shows an individual listing page with available dates' do
  scenario 'there is a page with listing details' do
    create_listing
    click_link("Details of Cong's Pad")
    expect(page.status_code).to eq 200
    expect(page).to have_content "Cambridge bachelorette pad"
  end

  scenario 'create an available date' do
    create_listing
    click_link("Details of Cong's Pad")
    select('22', :from => 'day')
    click_button 'Create available date'
    expect(page).to have_content "Available date: 22 August 2017"
    click_button 'Request to book'
  end

end
