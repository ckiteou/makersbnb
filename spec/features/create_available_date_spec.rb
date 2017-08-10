feature 'It shows available dates when listing is clicked' do
  scenario 'it shows a date' do
    create_listing
    click_link("Click here to request to book")
    expect(page.status_code).to eq 200
    expect(page).to have_content "Cambridge bachelorette pad"
  end
end
